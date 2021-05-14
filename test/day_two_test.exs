defmodule DayTwoTest do
  use ExUnit.Case

  test "solves part one sample" do
    solution = DayTwo.part_one("assets/day_two_sample.txt")
    assert solution == :ok
  end

  test "solves part one input" do
    solution = DayTwo.part_one("assets/day_two_input.txt")
    assert solution == :ok
  end

  test "solves part two sample" do
    solution = DayTwo.part_two("assets/day_two_sample.txt")
    assert solution == :ok
  end

  test "solves part two input" do
    solution = DayTwo.part_two("assets/day_two_input.txt")
    assert :ok == :ok
  end
end
