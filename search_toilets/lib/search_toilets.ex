defmodule SearchToilets do
  require Ecto.Query
  def main do
    SearchToilets.Repo.start_link()
    x = IO.gets("現在地のx座標を入力してください：")
    |> String.trim()
    |> String.to_float()
    y = IO.gets("現在地のy座標を入力してください：")
    |> String.trim()
    |> String.to_float()
    curr_position = [x, y]
    type = IO.gets("検索するトイレの種別を入力してください：")
    |> String.trim()

    show_result(type)
    |> Enum.map(&calculate_distance(&1, curr_position))
    |> Enum.filter(fn x -> Enum.at(x, 1) <= 150.0 end)
    |> show_toilets()
    |> Enum.map(fn x -> [x.id, x.position_x, x.position_y, x.waiting_time] end)

  end

  def create_database do
    toilets = [
      %SearchToilets.Toilet{waiting_time: 10, position_x: 10.5, position_y: 183.8, is_male: true, is_female: false, is_multi: false},
      %SearchToilets.Toilet{waiting_time: 25, position_x: 53.0, position_y: 102.0, is_male: false, is_female: true, is_multi: false},
      %SearchToilets.Toilet{waiting_time: 15, position_x: 103.0, position_y: 51.8, is_male: true, is_female: true, is_multi: true},
      %SearchToilets.Toilet{waiting_time: 30, position_x: 163.6, position_y: 78.0, is_male: true, is_female: true, is_multi: true},
      %SearchToilets.Toilet{waiting_time: 0, position_x: 248.2, position_y: 203.7, is_male: true, is_female: true, is_multi: true}
    ]

    Enum.each(toilets, fn(toilet) -> SearchToilets.Repo.insert(toilet) end)
  end

  def show_result(type) do

    case type do
      "M" -> SearchToilets.Toilet |> Ecto.Query.where(is_male: true)
      "F" -> SearchToilets.Toilet |> Ecto.Query.where(is_female: true)
      "mul" -> SearchToilets.Toilet |> Ecto.Query.where(is_multi: true)
    end
    |> SearchToilets.Repo.all
  end

  def calculate_distance(struct, curr_position) do
    [struct.id,
    :math.sqrt(
    :math.pow((struct.position_x - Enum.at(curr_position, 0)), 2) +
    :math.pow((struct.position_y - Enum.at(curr_position, 1)), 2)
    )]
  end

  def show_toilets(list) do
    Enum.map(list, fn x ->
      [id, _] = x
      SearchToilets.Toilet |> SearchToilets.Repo.get(id) end)
  end
end
