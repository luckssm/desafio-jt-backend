defmodule Backend.Tickets.GetAllPaginated do
  alias Backend.{Ticket, City, Repo}
  import Ecto.Query

  def calculate_total_pages(total_items, per_page) do
    if rem(total_items, per_page) == 0 do
      div(total_items, per_page)
    else
      div(total_items, per_page) + 1
    end
  end

  def call(%{current_page: current_page, per_page: per_page}) do
    query =
      from t in Ticket,
        limit: ^per_page,
        offset: ^((current_page - 1) * per_page),
        order_by: [asc: :id],
        preload: [:city, :ticket_values]

    count_query =
      from t in Ticket,
        select: count("*")

    case Repo.all(query) do
      [] ->
        {:error, "No tickets found"}

      items ->
        total_items = Repo.one(count_query)
        total_pages = calculate_total_pages(total_items, per_page)
        {:ok, %{total_items: total_items, total_pages: total_pages, tickets: items}}
    end
  end
end
