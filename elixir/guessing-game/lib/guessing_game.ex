defmodule GuessingGame do
  def compare(secret_number, guess \\ :guess)

  def compare(_secret_number, guess) when not is_number(guess) do
    "Make a guess"
  end

  def compare(secret_number, guess) do
    do_compare(secret_number, guess)
  end

  defp do_compare(num, num), do: "Correct"

  defp do_compare(secret_number, guess) when abs(secret_number - guess) == 1 do
    "So close"
  end

  defp do_compare(secret_number, guess)
       when guess > secret_number do
    "Too high"
  end

  defp do_compare(secret_number, guess)
       when secret_number > guess do
    "Too low"
  end
end
