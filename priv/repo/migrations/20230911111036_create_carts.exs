defmodule Backend.Repo.Migrations.CreateCarts do
  use Ecto.Migration

  def up do
    create table(:carts) do
      add :status, :string
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:carts, [:user_id])
  end

  def down do
    drop table(:carts) do
    end
  end
end
