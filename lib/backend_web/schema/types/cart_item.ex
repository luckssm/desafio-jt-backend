defmodule BackendWeb.Schema.Types.CartItem do
  use Absinthe.Schema.Notation

  object :cart_item do
    field :id, non_null(:id)
    field :quantity, non_null(:integer)
    field :ticket_value_id, non_null(:id)
    field :cart_id, non_null(:id)
    field :ticket_value, :ticket_value
  end

  input_object :create_cart_item_input do
    field :quantity, non_null(:integer)
    field :ticket_value_id, non_null(:id)
    field :cart_id, non_null(:id)
  end
end
