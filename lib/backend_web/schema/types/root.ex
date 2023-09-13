defmodule BackendWeb.Schema.Types.Root do
  use Absinthe.Schema.Notation

  alias BackendWeb.Resolvers.Ticket, as: TicketResolver
  alias BackendWeb.Resolvers.TicketValue, as: TicketValueResolver
  alias BackendWeb.Resolvers.City, as: CityResolver
  alias BackendWeb.Resolvers.User, as: UserResolver
  alias BackendWeb.Resolvers.Cart, as: CartResolver
  alias BackendWeb.Resolvers.CartItem, as: CartItemResolver

  import_types BackendWeb.Schema.Types.Ticket
  import_types BackendWeb.Schema.Types.TicketValue
  import_types BackendWeb.Schema.Types.City
  import_types BackendWeb.Schema.Types.User
  import_types BackendWeb.Schema.Types.Cart
  import_types BackendWeb.Schema.Types.CartItem

  object :root_query do
    # Ticket queries
    field :get_ticket, type: :ticket do
      arg :id, non_null(:id)

      resolve &TicketResolver.get/2
    end

    field :get_all_tickets, type: list_of(:ticket) do
      resolve &TicketResolver.get_all_tickets/2
    end

    field :get_all_tickets_paginated, type: :paginated_ticket do
      arg :current_page, non_null(:integer)
      arg :per_page, non_null(:integer)

      resolve &TicketResolver.get_all_tickets_paginated/2
    end

    field :get_tickets_by_city_name, type: list_of(:ticket) do
      arg :city_name, non_null(:string)

      resolve &TicketResolver.get_all_tickets_by_city_name/2
    end

    field :get_tickets_by_city_name_paginated, type: :paginated_ticket do
      arg :city_name, non_null(:string)
      arg :current_page, non_null(:integer)
      arg :per_page, non_null(:integer)

      resolve &TicketResolver.get_all_tickets_by_city_name_paginated/2
    end

    # TicketValue queries
    field :get_ticket_value, type: :ticket_value do
      arg :id, non_null(:id)

      resolve &TicketValueResolver.get/2
    end

    field :get_ticket_value_by_date_and_ticket_id, type: list_of(:ticket_value) do
      arg :ticket_id, non_null(:id)
      arg :day, non_null(:string)

      resolve &TicketValueResolver.get_by_date_and_ticket_id/2
    end

    # City queries
    field :get_city, type: :city do
      arg :id, non_null(:id)

      resolve &CityResolver.get/2
    end

    # User queries
    field :get_user, type: :user do
      arg :id, non_null(:id)

      resolve &UserResolver.get/2
    end

    # Cart queries
    field :get_cart, type: :cart do
      arg :id, non_null(:id)

      resolve &CartResolver.get/2
    end

    field :get_open_cart, type: :cart do
      arg :user_id, non_null(:id)

      resolve &CartResolver.get_open_cart/2
    end

    # CartItem queries
    field :get_cart_item, type: :cart_item do
      arg :id, non_null(:id)

      resolve &CartItemResolver.get/2
    end
  end

  object :root_mutation do
    # Ticket queries
    field :create_ticket, type: :ticket do
      arg :input, non_null(:create_ticket_input)

      resolve &TicketResolver.create/2
    end

    field :update_ticket, type: :ticket do
      arg :input, non_null(:update_ticket_input)

      resolve &TicketResolver.update/2
    end

    # TicketValue queries
    field :create_ticket_value, type: :ticket_value do
      arg :input, non_null(:create_ticket_value_input)

      resolve &TicketValueResolver.create/2
    end

    # City queries
    field :create_city, type: :city do
      arg :input, non_null(:create_city_input)

      resolve &CityResolver.create/2
    end

    # User queries
    field :create_user, type: :user do
      arg :input, non_null(:create_user_input)

      resolve &UserResolver.create/2
    end

    # Cart queries
    field :create_cart, type: :cart do
      arg :input, non_null(:create_cart_input)

      resolve &CartResolver.create/2
    end

    field :add_cart_items, type: :cart do
      arg :input, non_null(:add_items_input)

      resolve &CartResolver.add_cart_items/2
    end

    field :close_cart, type: :cart do
      arg :user_id, non_null(:id)

      resolve &CartResolver.close_cart/2
    end

    # CartItem queries
    field :create_cart_item, type: :cart_item do
      arg :input, non_null(:create_cart_item_input)

      resolve &CartItemResolver.create/2
    end

    field :user_remove_cart_item, type: :cart do
      arg :cart_item_id, non_null(:id)
      arg :user_id, non_null(:id)

      resolve &CartItemResolver.user_remove_cart_item/2
    end
  end
end
