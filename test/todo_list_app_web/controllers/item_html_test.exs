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
end
