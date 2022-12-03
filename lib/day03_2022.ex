defmodule Day032022 do
  def find_priority_total() do
    input = File.read!("lib/input/y2022_d03.txt")

    all_priorities = get_all_priorities()

    priority_sum =
      String.split(input, "\n")
      |> Enum.reduce(0, fn string, acc ->
        half_length = String.length(string) / 2
        split_string = String.split_at(string, round(half_length))

        intersection =
          Elixir.MapSet.to_list(
            Elixir.MapSet.intersection(
              Elixir.MapSet.new(String.graphemes(to_string(elem(split_string, 0)))),
              Elixir.MapSet.new(String.graphemes(to_string(elem(split_string, 1))))
            )
          )

        intersection_priority = all_priorities[List.first(intersection)]
        acc + intersection_priority
      end)

    IO.inspect(priority_sum)
  end

  def find_priority_total_2() do
    input = File.read!("lib/input/y2022_d03.txt")

    all_priorities = get_all_priorities()

    priority_sum =
      String.split(input, "\n")
      |> Enum.chunk_every(3)
      |> Enum.reduce(0, fn list, acc ->
        intersection =
          Elixir.MapSet.to_list(
            Elixir.MapSet.intersection(
              Elixir.MapSet.intersection(
                Elixir.MapSet.new(String.graphemes(Enum.at(list, 0))),
                Elixir.MapSet.new(String.graphemes(Enum.at(list, 1)))
              ),
              Elixir.MapSet.new(String.graphemes(Enum.at(list, 2)))
            )
          )

        intersection_priority = all_priorities[List.first(intersection)]
        acc + intersection_priority
      end)

    IO.inspect(priority_sum)
  end

  defp get_all_priorities do
    {_acc, lower_case_priority} =
      ?a..?z
      |> Enum.map(fn x -> <<x::utf8>> end)
      |> Enum.reduce({1, %{}}, fn letter, {acc, map} ->
        {acc + 1, Map.put(map, letter, acc)}
      end)

    {_acc, upper_case_priority} =
      ?A..?Z
      |> Enum.map(fn x -> <<x::utf8>> end)
      |> Enum.reduce({27, %{}}, fn letter, {acc, map} ->
        {acc + 1, Map.put(map, letter, acc)}
      end)

    Map.merge(lower_case_priority, upper_case_priority)
  end
end
