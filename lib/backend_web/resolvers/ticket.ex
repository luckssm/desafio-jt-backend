defmodule BackendWeb.Resolvers.Ticket do
  alias Backend.Tickets

  def create(%{input: params}, _context), do: Tickets.Create.call(params)
  def update(%{input: params}, _context), do: Tickets.Update.call(params)

  def get(%{id: ticket_id}, _context), do: Tickets.Get.call(ticket_id)
  def get_all_tickets(_args, _context), do: Tickets.GetAll.call()

  def get_all_tickets_paginated(%{current_page: current_page, per_page: per_page}, _context),
    do: Tickets.GetAllPaginated.call(%{current_page: current_page, per_page: per_page})

  def get_all_tickets_by_city_name(%{city_name: city_name}, _context),
    do: Tickets.GetAllByCityName.call(city_name)

  def get_all_tickets_by_city_name_paginated(
        %{city_name: city_name, current_page: current_page, per_page: per_page},
        _context
      ),
      do:
        Tickets.GetAllByCityNamePaginated.call(%{
          city_name: city_name,
          current_page: current_page,
          per_page: per_page
        })
end
