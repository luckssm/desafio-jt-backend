defmodule Backend.CartItem do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:quantity, :ticket_value_id, :cart_id]

  schema "cart_items" do
    field :quantity, :integer

    belongs_to :cart, Backend.Cart
    belongs_to :ticket_value, Backend.TicketValue

    timestamps()
  end

  @doc false
  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
