defmodule BackendWeb.GetTicketByIdTest do
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

  def get_ticket_by_id_conn(%{ticket_id: ticket_id, conn: conn}) do
    post(conn, "/api/graphql", %{
      "query" => @get_ticket_query,
      "variables" => %{
        "id" => ticket_id
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

  test "Get ticket by ID", %{conn: conn} do
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

    # Then gets the ticket id to get the ticket by ID
    ticket_id = get_ticket_id(%{ticket_response: response_create_ticket})

    # Expected ticket response when getting ticket by ID
    expected_get_ticket_response = %{
      "data" => %{
        "getTicket" => %{
          "name" => ticket_name,
          "details" => "Parque 1",
          "perks" => "breakfast",
          "id" => ticket_id
        }
      }
    }

    # Then gets the ticket by ID
    conn_get_ticket = get_ticket_by_id_conn(%{ticket_id: ticket_id, conn: conn})
    response_get_ticket = json_response(conn_get_ticket, 200)

    # Finally asserts
    assert response_get_ticket == expected_get_ticket_response
  end
end
