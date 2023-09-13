defmodule Backend.Carts.Close do
  alias Backend.{Cart, Repo}

  def call(%{cart_id: cart_id}) do
    case Repo.get(Cart, cart_id) do
      nil ->
        {:error, "Item not found for update"}

      item ->
        Cart.changeset(item, %{status: "Closed"})
        |> Repo.update()
    end
  end
end
