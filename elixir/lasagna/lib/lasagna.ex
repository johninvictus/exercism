defmodule Lasagna do
  def expected_minutes_in_oven, do: 40

  def remaining_minutes_in_oven(oven_time), do: expected_minutes_in_oven() - oven_time

  def preparation_time_in_minutes(layers_num), do: layers_num * 2

  def total_time_in_minutes(layers_num, oven_time) do
    layers_num
    |> preparation_time_in_minutes()
    |> Kernel.+(oven_time)
  end

  def alarm, do: "Ding!"
end
