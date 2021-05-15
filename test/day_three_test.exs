defmodule DayThreeTest do
  use ExUnit.Case

  test "solves part one sample" do
    solution = DayThree.part_one("assets/day_three_sample.txt")
    assert solution == :ok
  end

  test "solves part one input" do
    solution = DayThree.part_one("assets/day_three_input.txt")
    assert :ok == :ok
  end

  test "solves part two sample" do
    solution = DayThree.part_two("assets/day_three_sample.txt")
    assert :ok == :ok
  end

  test "solves part two input" do
    solution = DayThree.part_two("assets/day_three_input.txt")
    assert :ok == :ok
  end
end
