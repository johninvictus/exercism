defmodule Username do
  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss

    # Please implement the sanitize/1 function
    do_sanitize(username, ~c"")
  end

  defp do_sanitize(~c"", acc), do: acc

  defp do_sanitize([v | reset], acc) do
    case v do
      v when v in 97..122 ->
        do_sanitize(reset, acc ++ [v])

      v when v == 95 ->
        do_sanitize(reset, acc ++ [v])

      v when v == 228 ->
        do_sanitize(reset, acc ++ ~c"ae")

      v when v == 246 ->
        do_sanitize(reset, acc ++ ~c"oe")

      v when v == 252 ->
        do_sanitize(reset, acc ++ ~c"ue")

      v when v == 223 ->
        do_sanitize(reset, acc ++ ~c"ss")

      _ ->
        do_sanitize(reset, acc)
    end
  end
end
