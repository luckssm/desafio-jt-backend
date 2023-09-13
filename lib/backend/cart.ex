defmodule Backend.Cart do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:status, :user_id]

  schema "carts" do
    field :status, :string

    belongs_to :user, Backend.User
    has_many :cart_items, Backend.CartItem

    timestamps()
  end

  @doc false
  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end

  def changeset(record, attrs) do
    record
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
