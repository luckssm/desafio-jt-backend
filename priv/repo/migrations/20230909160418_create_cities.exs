defmodule Backend.Repo.Migrations.CreateCities do
  use Ecto.Migration

  def up do
    create table(:cities) do
      add :name, :string
      add :location, :string

      timestamps()
    end
  end

  def down do
    drop table(:cities) do
    end
  end
end
