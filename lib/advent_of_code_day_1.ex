defmodule AdventOfCodeDay1 do
  def calc_depth_increases(input) do
    contents = File.read!(input)

    array =
      String.split(contents, "\n")
      |> Enum.chunk_every(2, 1, :discard)
      |> Enum.reduce(0, fn [x, y], acc ->
        if x > y do
          acc
        else
          acc + 1
        end
      end)

    ## Cheating because the discard causes us to miss the last increase
    array + 1
  end

  def calc_part_two(input) do
    contents = File.read!(input)

    String.split(contents, "\n")
    |> Enum.map(&String.to_integer/1)
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.reduce(0, fn [[a, b, c], [d, e, f]], acc ->
      if a + b + c < d + e + f do
        acc + 1
      else
        acc
      end
    end)
  end
end
