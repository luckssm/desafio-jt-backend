defmodule Backend.TicketValue do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:day, :value, :type, :ticket_id]

  schema "ticket_values" do
    # having problem with :date type
    field :day, :string
    field :value, :integer
    field :type, :string

    belongs_to :ticket, Backend.Ticket
    has_many :cart_items, Backend.CartItem

    timestamps()
  end

  @doc false
  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
