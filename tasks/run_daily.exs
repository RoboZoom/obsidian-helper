defmodule Tasks.RunDaily do
  def get_path([p | _] = _args), do: p
  def get_path(_args), do: "/home/brian/Documents/Obsidian/personal"
end

args = System.argv() |> IO.inspect()

path = Tasks.RunDaily.get_path(args)

flags = %{simulated: true, verbosity: 1}

Subcommands.Daily.build_daily_folders(path, flags)
