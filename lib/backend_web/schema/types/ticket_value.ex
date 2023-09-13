defmodule BackendWeb.Schema.Types.TicketValue do
  use Absinthe.Schema.Notation

  object :ticket_value do
    field :id, non_null(:id)
    field :day, non_null(:string)
    field :type, non_null(:string)
    field :value, non_null(:integer)
    field :ticket_id, non_null(:id)
    field :ticket, :ticket
  end

  input_object :create_ticket_value_input do
    field :day, non_null(:string)
    field :type, non_null(:string)
    field :value, non_null(:integer)
    field :ticket_id, non_null(:id)
  end
end
