defmodule Backend.Repo.Migrations.CreateTicketValues do
  use Ecto.Migration

  def up do
    create table(:ticket_values) do
      add :value, :integer
      add :day, :string
      add :type, :string
      add :ticket_id, references(:tickets, on_delete: :nothing)

      timestamps()
    end

    create index(:ticket_values, [:ticket_id])
  end

  def down do
    drop table(:ticket_values) do
    end
  end
end
