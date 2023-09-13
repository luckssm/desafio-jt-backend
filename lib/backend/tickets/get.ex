defmodule Backend.Tickets.Get do
  alias Backend.{Ticket, Repo}
  import Ecto.Query

  def call(id) do
    query =
      from t in Ticket,
        where: t.id == ^id,
        select: t,
        preload: [:city, :ticket_values]

    case Repo.one(query) do
      nil -> {:error, "Item not found"}
      item -> {:ok, item}
    end
  end
end
