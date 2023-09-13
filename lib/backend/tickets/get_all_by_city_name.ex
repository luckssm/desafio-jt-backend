defmodule Backend.Tickets.GetAllByCityName do
  alias Backend.{Ticket, City, Repo}
  import Ecto.Query

  def call(city_name) do
    query =
      from t in Ticket,
        join: c in City,
        on: t.city_id == c.id,
        where: ilike(c.name, ^"%#{city_name}%"),
        select: t,
        preload: [:city]

    case Repo.all(query) do
      [] -> {:error, "No items found for this city."}
      items -> {:ok, items}
    end
  end
end
