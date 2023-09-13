defmodule Backend.CartItems.Delete do
  alias Backend.{CartItem, Repo}

  def call(id) do
    case Repo.get(CartItem, id) do
      nil ->
        {:error, "Item not found"}

      item ->
        case Repo.delete(item) do
          {:ok, item} ->
            {:ok, item}
        end
    end
  end
end
