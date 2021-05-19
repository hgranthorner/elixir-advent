defmodule DayThree do
  @slopes [{1, false}, {3, false}, {5, false}, {7, false}, {1, true}]

  def part_one(path) do
    {:ok, content} = File.read(path)
    lines = String.split(content, "\n")

    down_slope(lines, 0, [], 3, {false, false})
    |> Enum.filter(&(&1 == "#"))
    |> length
  end

  def part_two(path) do
    {:ok, content} = File.read(path)
    lines = String.split(content, "\n")

    down_slopes(lines, @slopes, [])
    |> Enum.map(fn x -> Enum.filter(x, &(&1 == "#")) end)
    |> Enum.map(&length/1)
    |> Enum.reduce(fn x, acc -> x * acc end)
  end

  defp down_slopes(slope, [{delta_x, skip} | rest], results) do
    down_slopes(slope, rest, [down_slope(slope, 0, [], delta_x, {skip, true}) |> IO.inspect | results])
  end

  defp down_slopes(_, [], results), do: results

  defp down_slope([current | rest], x_position, terrain, delta_x, {skip, skip_next}) do
    place = String.at(current, x_position)
    width = String.length(current)

    new_x =
      if x_position + delta_x >= width,
        do: x_position + delta_x - width,
        else: x_position + delta_x

    acc_terrain = [place | terrain]

    case {skip, skip_next, length(rest)} do
      {true, true, x} when x > 1 ->
        [_ | rest] = rest
        down_slope(rest, new_x, acc_terrain, delta_x, {skip, not skip_next})

      {true, true, x} when x <= 1 ->
        down_slope([], new_x, acc_terrain, delta_x, {skip, not skip_next})

      {true, false, _} ->
        down_slope(rest, new_x, acc_terrain, delta_x, {skip, not skip_next})

      _ ->
        down_slope(rest, new_x, acc_terrain, delta_x, {skip, skip_next})
    end
  end

  defp down_slope([], _, terrain, _, _), do: terrain
end
