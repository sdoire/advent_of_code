defmodule Day3 do
  def calc_position(input) do
    contents = File.read!(input)

    array = String.split(contents, "\n")

    input_length = String.length(List.first(array))
    # repeater_length = input_length - 1
    # accumulator = List.duplicate(0, input_length)
    result =
      array
      |> Enum.map(&String.graphemes/1)
      |> Enum.zip()

    result
  end
end
