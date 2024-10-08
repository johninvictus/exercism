defmodule CircularBuffer do
  @moduledoc """
  An API to a stateful process that fills and empties a circular buffer
  """

  @doc """
  Create a new buffer of a given capacity
  """
  @spec new(capacity :: integer) :: {:ok, pid}
  def new(capacity) do
    Agent.start_link(fn -> %{capacity: capacity, content: []} end)
  end

  @doc """
  Read the oldest entry in the buffer, fail if it is empty
  """
  @spec read(buffer :: pid) :: {:ok, any} | {:error, atom}
  def read(buffer) do
    Agent.get_and_update(buffer, fn %{capacity: _capacity, content: content} = state ->
      if Enum.empty?(content) do
        {{:error, :empty}, state}
      else
        {rest, [take]} = Enum.split(content, -1)
        {{:ok, take}, %{state | content: rest}}
      end
    end)
  end

  @doc """
  Write a new item in the buffer, fail if is full
  """
  @spec write(buffer :: pid, item :: any) :: :ok | {:error, atom}
  def write(buffer, item) do
    Agent.get_and_update(buffer, fn %{capacity: capacity, content: content} = state ->
      if Enum.count(content) == capacity do
        {{:error, :full}, state}
      else
        {:ok, %{state | content: [item | content]}}
      end
    end)
  end

  @doc """
  Write an item in the buffer, overwrite the oldest entry if it is full
  """
  @spec overwrite(buffer :: pid, item :: any) :: :ok
  def overwrite(buffer, item) do
    Agent.update(buffer, fn state ->
      if length(state.content) < state.capacity do
        %{state | content: [item | state.content]}
      else
        %{state | content: Enum.drop([item | state.content], -1)}
      end
    end)
  end

  @doc """
  Clear the buffer
  """
  @spec clear(buffer :: pid) :: :ok
  def clear(buffer) do
    Agent.cast(buffer, fn state -> %{state | content: []} end)
  end
end
