defmodule BackendWeb.Schema.Types.Cart do
  use Absinthe.Schema.Notation

  object :cart do
    field :id, non_null(:id)
    field :status, non_null(:string)
    field :user_id, non_null(:id)
    field :cart_items, list_of(:cart_item)
  end

  input_object :create_cart_input do
    field :status, non_null(:string)
    field :user_id, non_null(:id)
  end

  input_object :add_items_input do
    field :user_id, non_null(:id)
    field :ticket_values_ids, non_null(list_of(:id))
  end
end
