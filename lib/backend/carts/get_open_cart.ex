defmodule Backend.Carts.GetOpenCart do
  alias Backend.{Cart, Repo}
  import Ecto.Query

  def call(%{user_id: user_id}) do
    query =
      from c in Cart,
        where: c.user_id == ^user_id and like(c.status, ^"Open"),
        select: c,
        preload: [cart_items: [ticket_value: :ticket]]

    case Repo.one(query) do
      nil ->
        {:ok, nil}

      item ->
        {:ok, item}
    end
  end
end
