defmodule Backend.Tickets.Update do
  alias Backend.{Ticket, Repo}

  def call(%{id: ticket_id} = params) do
    case Repo.get(Ticket, ticket_id) do
      nil ->
        {:error, "Item not found for update"}

      item ->
        Ticket.changeset(item, params)
        |> Repo.update()
    end
  end
end
