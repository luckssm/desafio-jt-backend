defmodule Backend.Carts.Create do
  alias Backend.{Cart, Repo}

  def call(params) do
    Cart.changeset(params)
    |> Repo.insert()
  end
end
