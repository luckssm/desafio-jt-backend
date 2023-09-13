defmodule Backend.User do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:name, :email]

  schema "users" do
    field :email, :string
    field :name, :string

    has_many :carts, Backend.Cart

    timestamps()
  end

  @doc false
  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
