defmodule RPG.CharacterSheet do
  def welcome() do
    IO.puts("Welcome! Let's fill out your character sheet together.")
  end

  def ask_name() do
    get_console("What is your character's name?\n")
  end

  def ask_class() do
    get_console("What is your character's class?\n")
  end

  def ask_level() do
    "What is your character's level?\n"
    |> get_console()
    |> String.to_integer()
  end

  def run() do
    welcome()

    name = ask_name()
    class = ask_class()
    level = ask_level()

    body = %{class: class, level: level, name: name}

    IO.inspect(body, label: "\nYour character")
  end

  defp get_console(question) do
    question
    |> IO.gets()
    |> String.trim()
  end
end
