defmodule KitchenCalculator do
  def get_volume({_key, value}) do
    value
  end

  def to_milliliter({key, value}) do
    {:milliliter, value * milliliter_unit(key)}
  end

  def from_milliliter({:milliliter, value}, unit) do
    {unit, value / milliliter_unit(unit)}
  end

  def convert(volume_pair, unit) do
    volume_pair
    |> to_milliliter()
    |> from_milliliter(unit)
  end

  def milliliter_unit(:milliliter), do: 1
  def milliliter_unit(:cup), do: 240
  def milliliter_unit(:fluid_ounce), do: 30
  def milliliter_unit(:teaspoon), do: 5
  def milliliter_unit(:tablespoon), do: 15
end
