defmodule LanguageList do
  def new(), do: []

  def add(list, language) do
    [language | list]
  end

  def remove([]), do: []

  def remove([_ | tail]), do: tail

  def first([]), do: nil

  def first([first | _]), do: first

  def count(list) do
    do_count(list, 0)
  end

  def functional_list?(list) do
    functional_list(list, true)
  end

  defp do_count([], num), do: num

  defp do_count([_ | tail], num) do
    do_count(tail, num + 1)
  end

  defp functional_list([], functional?), do: functional?
  defp functional_list(_list, false), do: false

  defp functional_list([head | tail], functional?)
       when head in ~w(Clojure Haskell Erlang Elixir F#) do
    functional_list(tail, functional? && true)
  end

  defp functional_list([_head | tail], functional?) do
    functional_list(tail, functional? && false)
  end
end
