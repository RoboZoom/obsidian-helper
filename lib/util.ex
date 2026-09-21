defmodule Util do
  @moduledoc """
  Utility functions for application
  """

  def create_folder(name, path, %{simulated: sim, verbosity: v} = _flags) do
    "Creating Folder: #{path}/#{name}"
    |> sim_adder(sim)
    |> oprint(v, 1)

    case sim do
      false -> File.mkdir("#{path}/#{name}")
      _ -> {:info, "Command run in sim mode - not created."}
    end
  end

  def create_folders(folder_list, flags) do
    Enum.map(folder_list, fn {path, name} -> create_folder(name, path, flags) end)
  end

  @doc """
  Prints messages based on verbosity.
  Level 0 is silent.
  Level 1 is normal.
  Level 2 is verbose.
  """
  def oprint(msg, verbosity, level) do
    if verbosity >= level do
      IO.puts(msg)
    end
  end

  def sim_adder(msg, true = _sim) do
    msg <> " (SIMULATED)"
  end

  def sim_adder(msg, false), do: msg
end
