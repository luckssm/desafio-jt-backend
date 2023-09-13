defmodule Backend.Tickets.GetAll do
  alias Backend.{Ticket, City, Repo}
  import Ecto.Query

  def call() do
    query =
      from t in Ticket,
        select: t,
        preload: [:city, :ticket_values]

    case Repo.all(query) do
      [] -> {:error, "No tickets found"}
      items -> {:ok, items}
    end
  end
end
