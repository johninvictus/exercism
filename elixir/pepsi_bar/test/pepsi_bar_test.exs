defmodule PepsiBarTest do
  use ExUnit.Case

  test "nothing" do
    assert PepsiBar.render("", %{}) == ""
  end

  test "empty params" do
    assert PepsiBar.render("some text", %{}) == "some text"
  end

  test "blank for missing key" do
    assert PepsiBar.render("{{no_key}} and some text", %{}) == " and some text"
  end

  test "with key" do
    assert PepsiBar.render("some {{key}}", %{key: "foo"}) == "some foo"
  end

  test "duplicate keys" do
    assert PepsiBar.render("{{key}} and {{key}}!", %{key: "foo"}) == "foo and foo!"
  end

  test "with full template text" do
    assert PepsiBar.render("field1: {{foo}}, {{bar}}, {{baz}}", %{
             foo: "{{foo}}",
             bar: "this is bar"
           }) == "field1: {{foo}}, this is bar, "
  end

  test "with dot notation" do
    assert PepsiBar.render("abc: {{a.b.c}}, abe: {{a.b.e}}, cde: {{c.d.e}}", %{
             a: %{b: %{c: "dot"}}
           }) ==
             "abc: dot, abe: , cde: "
  end

  
  test "with dot notation and two values" do
    assert PepsiBar.render("abc: {{a.b.c}}, abe: {{a.b.e}}, cde: {{a.c.d.e}}", %{
             a: %{b: %{c: "dot"}, c: %{d: %{e: "e"}}}
           }) ==
             "abc: dot, abe: , cde: e"
  end
end
