defmodule SearchToilets.Toilet do
  use Ecto.Schema
  schema "toilets" do
      field :waiting_time, :integer
      field :position_x, :float
      field :position_y, :float
      field :is_male, :boolean
      field :is_female, :boolean
      field :is_multi, :boolean
  end
end
