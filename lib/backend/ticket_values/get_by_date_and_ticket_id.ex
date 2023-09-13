defmodule Backend.TicketValues.GetByDateAndTicketId do
  alias Backend.{Ticket, TicketValue, Repo}
  import Ecto.Query

  def call(%{ticket_id: ticket_id, day: day}) do
    query =
      from t in Ticket,
        join: tv in TicketValue,
        on: t.id == tv.ticket_id,
        where: t.id == ^ticket_id and ilike(tv.day, ^"%#{day}%"),
        select: tv

    case Repo.all(query) do
      [] ->
        {:error, "No ticket values found for this date and ticket."}

      items ->
        {:ok, items}
    end
  end
end
