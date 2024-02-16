defmodule TodoListAppWeb.ItemHTML do
  use TodoListAppWeb, :html

  embed_templates "item_html/*"

  def complete(item) do
    case item.status do
      1 -> "completed"
      _ -> ""
    end
  end
end
