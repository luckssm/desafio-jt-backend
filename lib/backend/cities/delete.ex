defmodule Backend.Cities.Delete do
  alias Backend.{City, Repo}

  def call(id) do
    case Repo.get(City, id) do
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
