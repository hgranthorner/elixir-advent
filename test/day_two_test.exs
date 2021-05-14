defmodule DayTwoTest do
  use ExUnit.Case

  test "solves part one sample" do
    solution = DayOne.part_one("assets/day_two_sample.txt")
    assert solution == :ok
  end

  test "solves part one input" do
    solution = DayOne.part_one("assets/day_two_input.txt")
    assert solution == :ok
  end

  test "solves part two sample" do
    solution = DayOne.part_two("assets/day_two_sample.txt")
    assert solution == :ok
  end

  test "solves part two input" do
    solution = DayOne.part_two("assets/day_two_input.txt")
    assert :ok == :ok
  end
end
