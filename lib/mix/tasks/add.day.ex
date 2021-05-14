defmodule Mix.Tasks.Add.Day do
  @moduledoc "Sets up the required files for a new day of advent challenges"
  @shortdoc "Generate new advent files"

  use Mix.Task

  @impl Mix.Task
  def run(args) do
    [day | _] = args
    content = "defmodule Day#{capitalize(day)} do
      def part_one(path) do
        :ok
      end

      def part_two(path) do
        :ok
      end
    end
    "

    test_content = "defmodule Day#{capitalize(day)}Test do
      use ExUnit.Case
      test \"solves part one sample\" do
        solution = Day#{capitalize(day)}.part_one(\"assets/day_#{day}_sample.txt\")
        assert solution == :ok
      end

      test \"solves part one input\" do
        solution = Day#{capitalize(day)}.part_one(\"assets/day_#{day}_input.txt\")
        assert solution == :ok
      end


      test \"solves part two sample\" do
        solution = Day#{capitalize(day)}.part_two(\"assets/day_#{day}_sample.txt\")
        assert solution == :ok
      end

      test \"solves part two input\" do
        solution = Day#{capitalize(day)}.part_two(\"assets/day_#{day}_input.txt\")
        assert :ok == :ok
      end
    end
    "

    File.write!("lib/day_#{day}.ex", content)
    File.write!("test/day_#{day}_test.exs", test_content)
    File.touch!("assets/day_#{day}_sample.txt")
    File.touch!("assets/day_#{day}_input.txt")
    Mix.Task.run("format")
  end

  def capitalize(arg) do
    with <<first::utf8, rest::binary>> <- arg, do: String.upcase(<<first::utf8>>) <> rest
  end
end
