defmodule BirdCount do
  def today([]), do: nil

  def today([today | _]), do: today

  def increment_day_count([]), do: [1]

  def increment_day_count([value | tail]) do
    [value + 1 | tail]
  end

  def has_day_without_birds?([]), do: false

  def has_day_without_birds?([0 | _rest]), do: true

  def has_day_without_birds?([_ | rest]) do
    has_day_without_birds?(rest)
  end

  def total(list) do
    do_total(list, 0)
  end

  def busy_days(list) do
    do_busy_days(list, 0)
  end

  defp do_busy_days([], acc), do: acc

  defp do_busy_days([head | tail], acc) when head >= 5 do
    do_busy_days(tail, acc + 1)
  end

  defp do_busy_days([_head | tail], acc) do
    do_busy_days(tail, acc)
  end

  defp do_total([], acc), do: acc

  defp do_total([head | rest], acc) do
    do_total(rest, acc + head)
  end
end
