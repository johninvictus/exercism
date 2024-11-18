defmodule PepsiBar do
  @moduledoc """
  Documentation for `PepsiBar`.
  """

  def render(template, options) do
    do_render(template, "", options)
  end

  defp do_render("", acc, _options), do: acc

  defp do_render(<<"{{", rest::binary>>, acc, options) do
    {value, rest} = extract_value(rest, "", options)

    do_render(rest, acc <> value, options)
  end

  defp do_render(<<char::utf8, rest::binary>>, acc, options) do
    do_render(rest, acc <> <<char::utf8>>, options)
  end

  defp extract_value(<<"}}", rest::binary>>, accum, options) do
    keys =
      accum
      |> String.split(".")
      |> Enum.map(&String.to_atom/1)

      value = get_in(options, keys) || ""

    {value, rest}
  end

  defp extract_value(<<char::utf8, rest::binary>>, accum, options) do
    extract_value(rest, accum <> <<char::utf8>>, options)
  end
end
