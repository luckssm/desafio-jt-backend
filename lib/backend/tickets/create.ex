defmodule Backend.Tickets.Create do
  alias Backend.{Ticket, Repo}

  def call(params) do
    Ticket.changeset(params)
    |> Repo.insert()
  end
end
