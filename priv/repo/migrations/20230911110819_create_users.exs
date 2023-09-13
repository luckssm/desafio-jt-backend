defmodule Backend.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def up do
    create table(:users) do
      add :name, :string
      add :email, :string

      timestamps()
    end
  end

  def down do
    drop table(:users) do
    end
  end
end
