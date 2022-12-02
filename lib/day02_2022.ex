defmodule Day022022 do
  def get_total_score() do
    contents = File.read!("lib/input/y2022_d02.txt")

    score =
      String.split(contents, "\n")
      |> Enum.reduce(0, fn pair, acc ->
          score_for_round = calc_score(pair)
          acc + score_for_round
        end)

    IO.inspect(score)
  end

  def get_total_score_2() do
    contents = File.read!("lib/input/y2022_d02.txt")

    score =
      String.split(contents, "\n")
      |> Enum.reduce(0, fn pair, acc ->
          score_for_round = calc_score_2(pair)
          acc + score_for_round
        end)

    IO.inspect(score)
  end

  defp calc_score("A X"), do: 4
  defp calc_score("A Y"), do: 8
  defp calc_score("A Z"), do: 3
  defp calc_score("B X"), do: 1
  defp calc_score("B Y"), do: 5
  defp calc_score("B Z"), do: 9
  defp calc_score("C X"), do: 7
  defp calc_score("C Y"), do: 2
  defp calc_score("C Z"), do: 6

  defp calc_score_2("A X"), do: 3
  defp calc_score_2("A Y"), do: 4
  defp calc_score_2("A Z"), do: 8
  defp calc_score_2("B X"), do: 1
  defp calc_score_2("B Y"), do: 5
  defp calc_score_2("B Z"), do: 9
  defp calc_score_2("C X"), do: 2
  defp calc_score_2("C Y"), do: 6
  defp calc_score_2("C Z"), do: 7
end
