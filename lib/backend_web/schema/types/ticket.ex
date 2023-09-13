defmodule BackendWeb.Schema.Types.Ticket do
  use Absinthe.Schema.Notation

  object :ticket do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :details, non_null(:string)
    field :perks, :string
    field :city_id, non_null(:id)
    field :city, :city
  end

  input_object :create_ticket_input do
    field :name, non_null(:string)
    field :details, non_null(:string)
    field :perks, :string
    field :city_id, non_null(:id)
  end

  input_object :update_ticket_input do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :details, non_null(:string)
    field :perks, :string
    field :city_id, non_null(:id)
  end

  object :paginated_ticket do
    field :tickets, list_of(:ticket)
    field :total_items, :integer
    field :total_pages, :integer
  end
end
