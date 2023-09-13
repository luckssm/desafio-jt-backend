defmodule BackendWeb.Resolvers.CartItem do
  alias Backend.{CartItems, Carts}

  def create(%{input: params}, _context), do: CartItems.Create.call(params)
  def get(%{id: cart_item_id}, _context), do: CartItems.Get.call(cart_item_id)

  def user_remove_cart_item(%{user_id: user_id, cart_item_id: cart_item_id}, _context) do
    case CartItems.Delete.call(cart_item_id) do
      {:ok, item} ->
        case Carts.GetOpenCart.call(%{user_id: user_id}) do
          {:ok, item} ->
            {:ok, item}
        end
    end
  end
end
