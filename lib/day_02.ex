defmodule Day2 do
  def calc_position(input) do
    contents = File.read!(input)

    result =
      String.split(contents, "\n")
      |> Enum.map(fn x -> String.split(x, " ") end)
      |> Enum.reduce(%{horizontal: 0, depth: 0}, fn [x, y], acc ->
        case x do
          "forward" ->
            {_, updated_acc} =
              Map.get_and_update(acc, :horizontal, fn h ->
                {h, h + String.to_integer(y)}
              end)

            updated_acc

          "down" ->
            {_, updated_acc} =
              Map.get_and_update(acc, :depth, fn d ->
                {d, d + String.to_integer(y)}
              end)

            updated_acc

          "up" ->
            {_, updated_acc} =
              Map.get_and_update(acc, :depth, fn d ->
                {d, d - String.to_integer(y)}
              end)

            updated_acc
        end
      end)

    result.depth * result.horizontal
  end

  def calc_position_2(input) do
    contents = File.read!(input)

    result =
      String.split(contents, "\n")
      |> Enum.map(fn x -> String.split(x, " ") end)
      |> Enum.reduce(%{horizontal: 0, depth: 0, aim: 0}, fn [x, y], acc ->
        case x do
          "forward" ->
            {_, updated_acc} =
              Map.get_and_update(acc, :horizontal, fn h ->
                {h, h + String.to_integer(y)}
              end)

            {_, updated_acc} =
              Map.get_and_update(updated_acc, :depth, fn d ->
                {d, d + updated_acc.aim * String.to_integer(y)}
              end)

            updated_acc

          "down" ->
            {_, updated_acc} =
              Map.get_and_update(acc, :aim, fn a ->
                {a, a + String.to_integer(y)}
              end)

            updated_acc

          "up" ->
            {_, updated_acc} =
              Map.get_and_update(acc, :aim, fn a ->
                {a, a - String.to_integer(y)}
              end)

            updated_acc
        end
      end)

    result.depth * result.horizontal
  end
end
