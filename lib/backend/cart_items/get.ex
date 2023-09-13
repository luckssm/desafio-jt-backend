defmodule Backend.CartItems.Get do
  alias Backend.{CartItem, Repo}

  def call(id) do
    case Repo.get(CartItem, id) do
      nil -> {:error, "Item not found"}
      item -> {:ok, item}
    end
  end
end
