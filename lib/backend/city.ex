defmodule Backend.City do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:name, :location]

  schema "cities" do
    field :location, :string
    field :name, :string

    has_many :tickets, Backend.Ticket

    timestamps()
  end

  @doc false
  def changeset(attrs) do
    %__MODULE__{}
    |> cast(attrs, @fields)
    |> validate_required(@fields)
  end
end
