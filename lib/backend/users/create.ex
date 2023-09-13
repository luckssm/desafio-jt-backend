defmodule Backend.Users.Create do
  alias Backend.{User, Repo}

  def call(params) do
    User.changeset(params)
    |> Repo.insert()
  end
end
