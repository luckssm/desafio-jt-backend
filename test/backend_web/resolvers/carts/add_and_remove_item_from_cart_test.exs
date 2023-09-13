defmodule BackendWeb.RemoveItemFromCartTest do
  use BackendWeb.ConnCase

  @create_city_query """
  mutation CreateCity($input: CreateCityInput!) {
    createCity(input: $input) {
      id
      name
      location
    }
  }
  """

  @create_ticket_query """
  mutation createTicket($input: CreateTicketInput!) {
    createTicket(input: $input) {
      details
      perks
      name
      cityId
      id
    }
  }
  """

  @create_ticket_value_query """
  mutation createTicketValue($input: CreateTicketValueInput!) {
    createTicketValue(input: $input) {
      id
      day
      type
      value
    }
  }
  """

  @add_cart_items_query """
  mutation addCartItems($input: AddItemsInput!) {
    addCartItems(input: $input) {
      id,
      status
      cartItems{
        id,
        ticketValueId
        quantity
        ticketValue{
          day
          value
          type
          ticket{
            name
          }
        }
      }
    }
  }
  """

  @add_cart_items_query """
  mutation addCartItems($input: AddItemsInput!) {
    addCartItems(input: $input) {
      id,
      status
      cartItems{
        id,
        ticketValueId
        quantity
        ticketValue{
          day
          value
          type
          ticket{
            name
          }
        }
      }
    }
  }
  """

  @remove_cart_item_query """
  mutation userRemoveCartItem($userId: ID!, $cartItemId: ID!) {
    userRemoveCartItem(userId: $userId, cartItemId: $cartItemId) {
      id,
      status
      cartItems{
        id,
        ticketValueId
        quantity
        ticketValue{
          day
          value
          type
          ticket{
            name
          }
        }
      }
    }
  }
  """

  @get_ticket_query """
  query getTicket($id: ID!) {
    getTicket(id: $id) {
      id
      name
      details
      perks
    }
  }
  """

  @get_open_cart_query """
  query getOpenCart($userId: ID!) {
    getOpenCart(userId: $userId) {
      id,
      status
      cartItems{
        id,
        ticketValueId
        quantity
        ticketValue{
          day
          value
          type
          ticket{
            name
          }
        }
      }
    }
  }
  """

  def create_random_string() do
    for _ <- 1..10, into: "", do: <<Enum.random('0123456789abcdef')>>
  end

  def create_city_conn(%{city_name: city_name, conn: conn}) do
    post(conn, "/api/graphql", %{
      "query" => @create_city_query,
      "variables" => %{
        "input" => %{
          "name" => "#{city_name}",
          "location" => "Flórida"
        }
      }
    })
  end

  def create_ticket_conn(%{ticket_name: ticket_name, city_id: city_id, conn: conn}) do
    post(conn, "/api/graphql", %{
      "query" => @create_ticket_query,
      "variables" => %{
        "input" => %{
          "name" => ticket_name,
          "details" => "Parque 1",
          "perks" => "breakfast",
          "cityId" => city_id
        }
      }
    })
  end

  def create_ticket_value_conn(%{day: day, ticket_id: ticket_id, conn: conn}) do
    post(conn, "/api/graphql", %{
      "query" => @create_ticket_value_query,
      "variables" => %{
        "input" => %{
          "day" => day,
          "type" => "Child",
          "value" => 23000,
          "ticketId" => ticket_id
        }
      }
    })
  end

  def add_cart_item_conn(%{user_id: user_id, ticket_value_id: ticket_value_id, conn: conn}) do
    post(conn, "/api/graphql", %{
      "query" => @add_cart_items_query,
      "variables" => %{
        "input" => %{
          "userId" => user_id,
          "ticketValuesIds" => [ticket_value_id]
        }
      }
    })
  end

  def remove_cart_item_conn(%{user_id: user_id, cart_item_id: cart_item_id, conn: conn}) do
    post(conn, "/api/graphql", %{
      "query" => @remove_cart_item_query,
      "variables" => %{
        "userId" => user_id,
        "cartItemId" => cart_item_id
      }
    })
  end

  def get_ticket_by_id_conn(%{ticket_id: ticket_id, conn: conn}) do
    post(conn, "/api/graphql", %{
      "query" => @get_ticket_query,
      "variables" => %{
        "id" => ticket_id
      }
    })
  end

  def get_user_open_cart_conn(%{user_id: user_id, conn: conn}) do
    post(conn, "/api/graphql", %{
      "query" => @get_open_cart_query,
      "variables" => %{
        "userId" => user_id
      }
    })
  end

  def get_city_id(%{city_response: city_response}) do
    case Map.get(city_response, "data") do
      %{"createCity" => %{"id" => city_id}} ->
        city_id

      _ ->
        raise "Invalid createCity response structure"
    end
  end

  def get_ticket_id(%{ticket_response: ticket_response}) do
    case Map.get(ticket_response, "data") do
      %{"createTicket" => %{"id" => ticket_id}} ->
        ticket_id

      _ ->
        raise "Invalid createTicket response structure"
    end
  end

  def get_ticket_value_id(%{ticket_value_response: ticket_value_response}) do
    case Map.get(ticket_value_response, "data") do
      %{"createTicketValue" => %{"id" => ticket_value_id}} ->
        ticket_value_id

      _ ->
        raise "Invalid createTicketValue response structure"
    end
  end

  def get_cart_item_id(%{cart_item_response: cart_item_response}) do
    case Map.get(cart_item_response, "data") do
      %{"addCartItems" => %{"cartItems" => cart_items}} ->
        cart_item = hd(cart_items)

        case Map.fetch(cart_item, "id") do
          {:ok, cart_item_id} -> cart_item_id
        end

      _ ->
        raise "Invalid addCartItems response structure"
    end
  end

  def get_cart_id(%{open_cart_response: open_cart_response}) do
    case Map.get(open_cart_response, "data") do
      %{"getOpenCart" => %{"id" => cart_id}} ->
        cart_id

      _ ->
        raise "Invalid getOpenCart response structure"
    end
  end

  test "Add and remove Item from cart", %{conn: conn} do
    # First create City
    city_name = create_random_string()
    conn_create_city = create_city_conn(%{city_name: city_name, conn: conn})
    response_city = json_response(conn_create_city, 200)

    # Then gets the city id to create the ticket
    city_id = get_city_id(%{city_response: response_city})

    # Then creates the ticket with the city ID
    ticket_name = create_random_string()

    conn_create_ticket =
      create_ticket_conn(%{ticket_name: ticket_name, city_id: city_id, conn: conn})

    response_create_ticket = json_response(conn_create_ticket, 200)

    # Then gets the ticket id to create the ticket value
    ticket_id = get_ticket_id(%{ticket_response: response_create_ticket})

    # Then creates the ticket value with the ticket ID
    ticket_value_day = create_random_string()

    conn_create_ticket_value =
      create_ticket_value_conn(%{day: ticket_value_day, ticket_id: ticket_id, conn: conn})

    response_create_ticket_value = json_response(conn_create_ticket_value, 200)

    # Then gets the ticket_value id to create the cart item
    ticket_value_id = get_ticket_value_id(%{ticket_value_response: response_create_ticket_value})

    # Creates a new random user so that we have a cart
    random_user_name = create_random_string()

    user =
      Backend.Repo.insert!(%Backend.User{
        name: random_user_name,
        email: "#{random_user_name}@email.com"
      })

    # Adds a cart_item to the user cart
    conn_add_cart_item =
      add_cart_item_conn(%{user_id: user.id, ticket_value_id: ticket_value_id, conn: conn})

    response_add_cart_item = json_response(conn_add_cart_item, 200)

    # Gets the cart_item id so that we can remove it from cart later
    cart_item_id = get_cart_item_id(%{cart_item_response: response_add_cart_item})

    # Gets the open cart
    conn_user_open_cart = get_user_open_cart_conn(%{user_id: user.id, conn: conn})

    response_get_user_open_cart = json_response(conn_user_open_cart, 200)

    # Gets the open cart id to assert
    cart_id = get_cart_id(%{open_cart_response: response_get_user_open_cart})

    expected_get_user_open_cart_response = %{
      "data" => %{
        "getOpenCart" => %{
          "cartItems" => [
            %{
              "id" => cart_item_id,
              "quantity" => 1,
              "ticketValue" => %{
                "day" => ticket_value_day,
                "ticket" => %{"name" => ticket_name},
                "type" => "Child",
                "value" => 23000
              },
              "ticketValueId" => ticket_value_id
            }
          ],
          "id" => cart_id,
          "status" => "Open"
        }
      }
    }

    # Asserts if the item is in the cart
    assert response_get_user_open_cart == expected_get_user_open_cart_response

    # Remove item from cart
    conn_remove_cart_item =
      remove_cart_item_conn(%{user_id: user.id, cart_item_id: cart_item_id, conn: conn})

    response_remove_cart_item = json_response(conn_remove_cart_item, 200)

    # The response from cart item remove should be an empty open cart
    expected_remove_cart_item_response = %{
      "data" => %{
        "userRemoveCartItem" => %{
          "cartItems" => [],
          "id" => cart_id,
          "status" => "Open"
        }
      }
    }

    assert response_remove_cart_item == expected_remove_cart_item_response
  end
end
