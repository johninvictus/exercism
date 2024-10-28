defmodule Username do
  def sanitize(username) do
    # ä becomes ae
    # ö becomes oe
    # ü becomes ue
    # ß becomes ss
    do_sanitize(username, ~c"")
  end

  defp do_sanitize(~c"", acc), do: acc

  defp do_sanitize([v | reset], acc) do
    case v do
      v when v in ?a..?z ->
        do_sanitize(reset, acc ++ [v])

      v when v == ?_ ->
        do_sanitize(reset, acc ++ [v])

      v when v ==  ?ä->
        do_sanitize(reset, acc ++ ~c"ae")

      v when v == ?ö ->
        do_sanitize(reset, acc ++ ~c"oe")

      v when v == ?ü ->
        do_sanitize(reset, acc ++ ~c"ue")

      v when v == ?ß ->
        do_sanitize(reset, acc ++ ~c"ss")

      _ ->
        do_sanitize(reset, acc)
    end
  end
end
