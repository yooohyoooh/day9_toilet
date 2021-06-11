defmodule SearchToilets do
  def main do
    x = 5.5
    #IO.gets("現在地のx座標を入力してください：")
    #|> String.trim()
    #|> String.to_float()
    y = 25.8
      #IO.gets("現在地のy座標を入力してください：")
    #|> String.trim()
    #|> String.to_float()
    IO.inspect([x, y])
    type = IO.gets("検索するトイレの種別を入力してください：")
    |> String.trim()

    show_result(type)
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
    require Ecto.Query
    case type do
      "M" -> SearchToilets.Toilet |> Ecto.Query.where(is_male: true)
      "F" -> SearchToilets.Toilet |> Ecto.Query.where(is_female: true)
      "mul" -> SearchToilets.Toilet |> Ecto.Query.where(is_multi: true)
    end
    |> SearchToilets.Repo.all
  end

end
