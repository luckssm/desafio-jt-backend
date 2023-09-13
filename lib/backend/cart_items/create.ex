defmodule Backend.CartItems.Create do
  alias Backend.{CartItem, Repo}

  def call(params) do
    params
    |> CartItem.changeset()
    |> Repo.insert()
  end
end
