defmodule DayThree do
  def part_one(path) do
    {:ok, content} = File.read(path)
    toboggan = {0, 0}
    :ok
  end

  def part_two(path) do
    {:ok, content} = File.read(path)
    :ok
  end

  defp move_toboggan({x, y}, delta_x, delta_y) do
    {x + delta_x, y + delta_y}
  end

  defp wrap_toboggan({x, y}, max_x, max_y) do

  end
end
