defmodule Backend.Carts.Get do
  alias Backend.{Cart, Repo}

  def call(id) do
    case Repo.get(Cart, id) do
      nil -> {:error, "Item not found"}
      item -> {:ok, item}
    end
  end
end
