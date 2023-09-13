defmodule BackendWeb.Resolvers.Cart do
  alias Backend.{Carts, CartItems}

  def create(%{input: params}, _context), do: Carts.Create.call(params)

  def get(%{id: cart_id}, _context), do: Carts.Get.call(cart_id)

  def get_open_cart(%{user_id: user_id}, _context),
    do: Carts.GetOpenCart.call(%{user_id: user_id})

  def create_cart_items(%{ticket_values_ids: ticket_values_ids, cart_id: cart_id}) do
    Enum.map(ticket_values_ids, fn ticket_value_id ->
      CartItems.Create.call(%{cart_id: cart_id, ticket_value_id: ticket_value_id, quantity: 1})
    end)
  end

  def add_cart_items(%{input: params}, _context) do
    ticket_values_ids = params.ticket_values_ids
    user_id = params.user_id

    case Carts.GetOpenCart.call(%{user_id: user_id}) do
      {:ok, nil} ->
        case Carts.Create.call(%{user_id: user_id, status: "Open"}) do
          {:ok, item} ->
            create_cart_items(%{ticket_values_ids: ticket_values_ids, cart_id: item.id})

            case Carts.GetOpenCart.call(%{user_id: user_id}) do
              {:ok, item} ->
                {:ok, item}
            end

          {:error, reason} ->
            {:error, reason}
        end

      {:ok, item} ->
        create_cart_items(%{ticket_values_ids: ticket_values_ids, cart_id: item.id})

        case Carts.GetOpenCart.call(%{user_id: user_id}) do
          {:ok, item} ->
            {:ok, item}
        end
    end
  end

  def close_cart(%{user_id: user_id}, _context) do
    case Carts.GetOpenCart.call(%{user_id: user_id}) do
      nil ->
        {:ok, nil}

      {:ok, item} ->
        case Carts.Close.call(%{cart_id: item.id}) do
          nil ->
            {:ok, nil}

          item ->
            case Carts.GetOpenCart.call(%{user_id: user_id}) do
              {:ok, item} ->
                {:ok, item}
            end
        end
    end
  end
end
