defmodule TodoListAppWeb.ItemHTMLTest do
  use TodoListAppWeb.ConnCase, async: true
  alias TodoListAppWeb.ItemHTML

  test "remaining_items/1 returns count of items where item.status==0" do
    items = [
      %{text: "one", status: 0},
      %{text: "two", status: 0},
      %{text: "done", status: 1}
    ]

    assert ItemHTML.remaining_items(items) == 2
  end

  test "remaining_items/1 returns 0 (zero) when no items are status==0" do
    items = []
    assert ItemHTML.remaining_items(items) == 0
  end

  test "test filter function" do
    items = [
      %{text: "one", status: 0},
      %{text: "two", status: 0},
      %{text: "three", status: 1},
      %{text: "four", status: 2},
      %{text: "five", status: 2},
      %{text: "six", status: 1}
    ]

    assert length(ItemHTML.filter(items, "items")) == 4
    assert length(ItemHTML.filter(items, "active")) == 2
    assert length(ItemHTML.filter(items, "completed")) == 2
    assert length(ItemHTML.filter(items, "any")) == 4
  end
end
