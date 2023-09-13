defmodule BackendWeb.Resolvers.TicketValue do
  alias Backend.TicketValues

  def create(%{input: params}, _context), do: TicketValues.Create.call(params)
  def get(%{id: ticket_value_id}, _context), do: TicketValues.Get.call(ticket_value_id)

  def get_by_date_and_ticket_id(%{ticket_id: ticket_id, day: day}, _context),
    do: TicketValues.GetByDateAndTicketId.call(%{ticket_id: ticket_id, day: day})
end
