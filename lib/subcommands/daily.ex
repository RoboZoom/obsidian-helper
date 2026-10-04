defmodule Subcommands.Daily do
  import Util

  def main(_args, _flags) do

  end

  def build_daily_folders(vault_path, flags) do
    today = NaiveDateTime.local_now() |> Date.to_string()
    top_path = Path.join([vault_path, daily_name(), today])

    folders =
      ["Meetings", "Notes"]
      |> Enum.map(&Path.join(top_path, &1))


    create_folders(folders, flags)


  end
end
