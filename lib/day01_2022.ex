defmodule Day01_2022 do
  def findMaxCalorie() do
    contents = File.read!("lib/input/y2022_d01.txt")

    split =
      String.split(contents, "\n")
      |> Enum.chunk_by(&(&1 == ""))
      |> Enum.reject(&(&1 == [""]))
      |> Enum.reduce(0, fn elf, acc ->
        calories =
          elf
          |> Enum.map(&String.to_integer/1)
          |> Enum.sum()

        if calories > acc do
          calories
        else
          acc
        end
      end)

    IO.inspect(split)
  end

  def findTop3MaxCalorie() do
    contents = File.read!("lib/input/y2022_d01.txt")

    split =
      String.split(contents, "\n")
      |> Enum.chunk_by(&(&1 == ""))
      |> Enum.reject(&(&1 == [""]))
      |> Enum.reduce([0, 0, 0], fn elf, acc ->
        calories =
          elf
          |> Enum.map(&String.to_integer/1)
          |> Enum.sum()

        cond do
          calories > Enum.at(acc, 0) ->
            [calories, Enum.at(acc, 0), Enum.at(acc, 1)]

          calories > Enum.at(acc, 1) ->
            [Enum.at(acc, 0), calories, Enum.at(acc, 1)]

          calories > Enum.at(acc, 2) ->
            [Enum.at(acc, 0), Enum.at(acc, 1), calories]

          true ->
            acc
        end
      end)

    IO.inspect(Enum.sum(split))
  end
end
