defmodule BackendWeb.ListTicketsByCityNameTest do
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

  @get_ticket_by_city_name_query """
  query getTicketsByCityName($cityName: String!) {
    getTicketsByCityName(cityName: $cityName) {
      name
      perks
      details
      city {
        id
        name
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

  def create_get_ticket_by_city_name_conn(%{city_name: city_name, conn: conn}) do
    post(conn, "/api/graphql", %{
      "query" => @get_ticket_by_city_name_query,
      "variables" => %{
        "cityName" => city_name
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

  test "List tickets by city name", %{conn: conn} do
    # Create first City (there is probably a better way to do this)
    city_name_1 = create_random_string()
    conn_create_city_1 = create_city_conn(%{city_name: city_name_1, conn: conn})
    response_city_1 = json_response(conn_create_city_1, 200)
    city_id_1 = get_city_id(%{city_response: response_city_1})

    # Create second City
    city_name_2 = create_random_string()
    conn_create_city_2 = create_city_conn(%{city_name: city_name_2, conn: conn})
    response_city_2 = json_response(conn_create_city_2, 200)
    city_id_2 = get_city_id(%{city_response: response_city_2})

    # Then creates two tickets for first city
    ticket_name_1 = create_random_string()

    conn_create_ticket_1 =
      create_ticket_conn(%{ticket_name: ticket_name_1, city_id: city_id_1, conn: conn})

    _response_create_ticket_1 = json_response(conn_create_ticket_1, 200)

    ticket_name_2 = create_random_string()

    conn_create_ticket_2 =
      create_ticket_conn(%{ticket_name: ticket_name_2, city_id: city_id_1, conn: conn})

    _response_create_ticket_2 = json_response(conn_create_ticket_2, 200)

    # And one ticket for second city
    ticket_name_3 = create_random_string()

    conn_create_ticket_3 =
      create_ticket_conn(%{ticket_name: ticket_name_3, city_id: city_id_2, conn: conn})

    _response_create_ticket_3 = json_response(conn_create_ticket_3, 200)

    # Searches by first city name
    ticket_search_by_city_name_conn =
      create_get_ticket_by_city_name_conn(%{city_name: city_name_1, conn: conn})

    response_searched_tickets = json_response(ticket_search_by_city_name_conn, 200)

    # Expects returned values to be ticket 1 and 2
    expected_searched_tickets_response = %{
      "data" => %{
        "getTicketsByCityName" => [
          %{
            "city" => %{"id" => city_id_1, "name" => city_name_1},
            "details" => "Parque 1",
            "name" => ticket_name_1,
            "perks" => "breakfast"
          },
          %{
            "city" => %{"id" => city_id_1, "name" => city_name_1},
            "details" => "Parque 1",
            "name" => ticket_name_2,
            "perks" => "breakfast"
          }
        ]
      }
    }

    # Finally asserts
    assert response_searched_tickets == expected_searched_tickets_response
  end
end
