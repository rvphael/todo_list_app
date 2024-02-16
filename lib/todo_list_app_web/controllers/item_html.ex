defmodule TodoListAppWeb.ItemHTML do
  use TodoListAppWeb, :html

  embed_templates "item_html/*"

  def complete(item) do
    case item.status do
      1 -> "completed"
      _ -> ""
    end
  end

  def remaining_items(items) do
    Enum.filter(items, fn i -> i.status == 0 end) |> Enum.count()
  end
end
