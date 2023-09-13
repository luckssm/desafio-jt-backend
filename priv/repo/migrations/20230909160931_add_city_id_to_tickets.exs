defmodule Backend.Repo.Migrations.AddCityIdToTickets do
  use Ecto.Migration

  def up do
    alter table(:tickets) do
      add :city_id, references(:cities, on_delete: :nothing)
    end
  end

  def down do
    alter table(:tickets) do
      remove :city_id
    end
  end
end
