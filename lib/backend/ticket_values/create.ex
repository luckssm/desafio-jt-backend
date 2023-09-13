defmodule Backend.TicketValues.Create do
  alias Backend.{TicketValue, Repo}

  def call(params) do
    params
    |> TicketValue.changeset()
    |> Repo.insert()
  end
end
