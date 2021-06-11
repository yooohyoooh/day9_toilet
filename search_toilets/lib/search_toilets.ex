defmodule SearchToilets do
  def main do
    toilets = [
      %SearchToilets.Toilet{waiting_time: 10, position_x: 10.5, position_y: 183.8, is_male: true, is_female: false, is_multi: false},
      %SearchToilets.Toilet{waiting_time: 25, position_x: 53.0, position_y: 102.0, is_male: false, is_female: true, is_multi: false},
      %SearchToilets.Toilet{waiting_time: 15, position_x: 103.0, position_y: 51.8, is_male: true, is_female: true, is_multi: true},
      %SearchToilets.Toilet{waiting_time: 30, position_x: 163.6, position_y: 78.0, is_male: true, is_female: true, is_multi: true},
      %SearchToilets.Toilet{waiting_time: 0, position_x: 248.2, position_y: 203.7, is_male: true, is_female: true, is_multi: true}
    ]

    Enum.each(toilets, fn(toilet) -> SearchToilets.Repo.insert(toilet) end)
  end
end
