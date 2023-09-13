defmodule Backend.Users.Get do
  alias Backend.{User, Repo}

  def call(id) do
    case Repo.get(User, id) do
      nil -> {:error, "Item not found"}
      item -> {:ok, item}
    end
  end
end
