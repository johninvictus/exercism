defmodule HighScore do
  def new(), do: %{}

  def add_player(scores, name, score \\ 0) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    Map.put(scores, name, 0)
  end

  def update_score(scores, name, score) do
    case Map.fetch(scores, name) do
      {:ok, value} ->
        Map.put(scores, name, value + score)

      :error ->
        Map.put(scores, name, score)
    end
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
