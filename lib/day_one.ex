defmodule DayOne do
  def part_one(path) do
    {:ok, input} = File.read(path)

    split =
      String.split(input, "\n")
      |> Enum.map(&String.to_integer/1)

    reversed = Enum.reverse(split)

    pid = self()

    for x <- split do
      spawn(fn ->
        stream = Stream.take_while(reversed, fn y -> y != x end)

        for z <- stream do
          spawn(fn ->
            case x + z do
              2020 -> send(pid, {:done, {x, z}})
              _ -> :ok
            end
          end)
        end
      end)
    end

    receive do
      {:done, {x, y}} ->
        x * y
    end
  end

  def part_two(path) do
    {:ok, input} = File.read(path)

    split =
      String.split(input, "\n")
      |> Enum.map(&String.to_integer/1)
      |> Enum.with_index

    reversed = Enum.reverse(split)

    pid = self()

    for {x, i} <- split do
      spawn(fn ->
        remaining = Stream.filter(split, fn {_, i2} -> i2 > i end)
        for {y, i2} <- remaining do
          spawn(fn ->
            rev = Stream.take_while(reversed, fn {r, i3} -> i3 > i2 end)
            for {z, _} <- rev do
              case x + y + z do
                2020 -> send(pid, {:done, {x, y, z}})
                _ -> :ok
              end
            end
          end)
        end
      end)
    end

    receive do
      {:done, {x, y, z}} ->
        x * y * z
    end
  end
end
