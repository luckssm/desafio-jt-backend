defmodule Backend.Repo.Migrations.CreateTickets do
  use Ecto.Migration

  def up do
    create table(:tickets) do
      add :name, :string
      add :details, :text
      add :perks, :string

      timestamps()
    end
  end

  def down do
    drop table(:tickets) do
    end
  end
end
