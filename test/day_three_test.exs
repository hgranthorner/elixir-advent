defmodule DayThreeTest do
  use ExUnit.Case

  test "solves part one sample" do
    solution = DayThree.part_one("assets/day_three_sample.txt")
    assert solution == 7
  end

  test "solves part one input" do
    solution = DayThree.part_one("assets/day_three_input.txt") |> IO.inspect()
    assert solution == 164
  end

  test "solves part two sample" do
    _solution = DayThree.part_two("assets/day_three_sample.txt")
    assert :ok == :ok
  end

  test "solves part two input" do
    _solution = DayThree.part_two("assets/day_three_input.txt")
    assert :ok == :ok
  end
end
