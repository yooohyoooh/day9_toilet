defmodule SearchToilets.Repo.Migrations.CreateToilets do
  use Ecto.Migration

  def change do
    create table(:toilets) do
      add :waiting_time, :integer
      add :position_x, :float
      add :position_y, :float
      add :is_male, :boolean
      add :is_female, :boolean
      add :is_multi, :boolean
    end
  end
end
