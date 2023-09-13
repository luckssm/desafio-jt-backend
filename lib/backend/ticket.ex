defmodule Backend.Ticket do
  use Ecto.Schema
  import Ecto.Changeset

  @fields [:name, :details, :perks, :city_id]

  schema "tickets" do
    field :details, :string
    field :name, :string
    field :perks, :string

    belongs_to :city, Backend.City
    has_many :ticket_values, Backend.TicketValue

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
