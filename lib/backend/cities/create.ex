defmodule Backend.Cities.Create do
  alias Backend.{City, Repo}

  def call(params) do
    params
    |> City.changeset()
    |> Repo.insert()
  end
end
