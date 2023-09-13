defmodule Backend.Cities.Get do
  alias Backend.{City, Repo}

  def call(id) do
    case Repo.get(City, id) do
      nil -> {:error, "Item not found"}
      item -> {:ok, item}
    end
  end
end
