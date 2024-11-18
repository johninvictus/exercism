defmodule PepsiBarTest do
  use ExUnit.Case
  doctest PepsiBar

  test "greets the world" do
    assert PepsiBar.hello() == :world
  end
end
