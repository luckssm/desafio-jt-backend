defmodule Backend.Repo.Migrations.CreateCartItems do
  use Ecto.Migration

  def up do
    create table(:cart_items) do
      add :quantity, :integer
      add :ticket_value_id, references(:ticket_values, on_delete: :nothing)
      add :cart_id, references(:carts, on_delete: :nothing)

      timestamps()
    end

    create index(:cart_items, [:ticket_value_id])
    create index(:cart_items, [:cart_id])
  end

  def down do
    drop table(:cart_items) do
    end
  end
end
