defmodule DayTwo do
  def part_one(path) do
    re = ~r/(\d+)-(\d+)\s(.):\s(.*)/
    {:ok, content} = File.read(path)

    String.split(content, "\n")
    |> Stream.map(&Regex.run(re, &1))
    |> Stream.map(&groups_to_map(&1))
    |> Stream.map(fn map ->
      count = String.to_charlist(map.pattern) |> Enum.filter(&(&1 == map.char)) |> length()

      if count >= map.minimum && count <= map.maximum do
        :success
      else
        :failure
      end
    end)
    |> Enum.filter(&(&1 == :success))
    |> length
  end

  defp groups_to_map([_, minimum, maximum, letter, pattern]) do
    [char | []] = String.to_charlist(letter)

    %{
      :minimum => String.to_integer(minimum),
      :maximum => String.to_integer(maximum),
      :letter => letter,
      :pattern => pattern,
      :char => char
    }
  end

  defp xor(b1, b2) do
    (b1 and not b2) or (not b1 and b2)
  end

  def part_two(path) do
    re = ~r/(\d+)-(\d+)\s(.):\s(.*)/
    {:ok, content} = File.read(path)

    String.split(content, "\n")
    |> Stream.map(&Regex.run(re, &1))
    |> Stream.map(&groups_to_map(&1))
    |> Stream.map(fn map ->
      first = String.at(map.pattern, map.minimum - 1) == <<map.char::utf8>>
      second = String.at(map.pattern, map.maximum - 1) == <<map.char::utf8>>

      if xor(first, second) do
        :success
      else
        :failure
      end
    end)
    |> Enum.filter(&(&1 == :success))
    |> length
  end
end
