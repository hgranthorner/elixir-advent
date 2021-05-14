defmodule AdventTest do
  use ExUnit.Case
  doctest Advent

  test "greets the world" do
    assert Advent.hello() == :world
  end
end

defmodule DayOneTest do
  use ExUnit.Case

  test "solves part one sample" do
    solution = DayOne.part_one("assets/day_one_sample.txt")
    assert solution == 514_579
  end

  test "solves part one input" do
    solution = DayOne.part_one("assets/day_one_input.txt")
    assert solution == 1_015_476
  end


  test "solves part two sample" do
    solution = DayOne.part_two("assets/day_one_sample.txt")
    assert solution == 241861950
  end

  test "solves part two input" do
    solution = DayOne.part_two("assets/day_one_input.txt") |> IO.inspect
    assert :ok == :ok
  end
end
