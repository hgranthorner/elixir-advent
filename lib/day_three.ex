defmodule DayThree do
  def part_one(path) do
    {:ok, content} = File.read(path)
    lines = String.split(content, "\n")

    down_slope(lines, 0, [])
    |> Enum.filter(&(&1 == "#"))
    |> length
  end

  def part_two(path) do
    {:ok, content} = File.read(path)
    :ok
  end

  defp down_slope([current | rest], x_position, characters) do
    terrain = String.at(current, x_position)
    width = String.length(current)
    new_x = if x_position + 3 >= width, do: x_position + 3 - width, else: x_position + 3
    down_slope(rest, new_x, [terrain | characters])
  end

  defp down_slope([], _, characters), do: characters
end
