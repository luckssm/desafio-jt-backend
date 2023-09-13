defmodule Backend.TicketValues.Get do
  alias Backend.{TicketValue, Repo}

  def call(id) do
    case Repo.get(TicketValue, id) do
      nil -> {:error, "Item not found"}
      item -> {:ok, item}
    end
  end
end
