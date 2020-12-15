import AdventOfCode

defmodule AdventOfCode.Y2020.D8 do
#aoc 2020, 8 do
  def part1(input) do
    input
    |> Enum.map(&String.split/1)
    |> Enum.map(fn [l, r] -> {String.to_existing_atom(l), String.to_integer(r)} end)
    |> IO.inspect
    |> :array.from_list()
    |> IO.inspect
    |> run_until_revisit() 
    |> elem(1)
  end
  
  defp parse_operation(op) do
    Regex.named_captures(~r/(?<op>nop|acc|jmp) (?<dir>\+|\-)(?<inc>\d+)/, op)
    |> IO.inspect
  end

  def part2(input) do
  end
  
  ### NOT MY CODE. From here: https://github.com/mathsaey/adventofcode/blob/master/lib/2020/8.ex
  ### Committing just to file an issue around intellij-elixir
  def find_flip(original_prg, ctr \\ 0) do
    {changed_prg, ctr} = flip(original_prg, ctr)
    case run_until_revisit(changed_prg) do
      {:done, acc} -> acc
      _ -> find_flip(original_prg, ctr + 1)
    end
  end

  def flip(prg, idx) do
    ins = :array.get(idx, prg)
    case ins do
      {:nop, arg} -> {:array.set(idx, {:jmp, arg}, prg), idx}
      {:jmp, arg} -> {:array.set(idx, {:nop, arg}, prg), idx}
      _ -> flip(prg, idx + 1)
    end
  end

  def run_until_revisit(prg, ic \\ 0, acc \\ 0, visited \\ []) do
    {ic, acc} = step(prg, ic, acc)

    cond do
      ic == :done -> {:done, acc}
      ic in visited -> {:loop, acc}
      true -> run_until_revisit(prg, ic, acc, [ic | visited])
    end
  end

  def step(prg, ic, acc) do
    case :array.get(ic, prg) do
      {ins, arg} -> exec(ins, arg, ic, acc)
      :undefined -> {:done, acc}
    end
  end

  def exec(:nop, _, ic, acc), do: {ic + 1, acc}
  def exec(:jmp, n, ic, acc), do: {ic + n, acc}
  def exec(:acc, n, ic, acc), do: {ic + 1, acc + n}
end
