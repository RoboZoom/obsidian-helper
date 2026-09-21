defmodule ObsidianHelper do
  @moduledoc """
  Documentation for `ObsidianHelper`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> ObsidianHelper.hello()
      :world

  """
  def main(argv) do
    Optimus.new!(
      name: "obsidian_helper",
      description: "All-purpose utility to setup and sustain regular use of obsidian vaults",
      version: "0.0.1",
      author: "Brian Sump",
      allow_unknown_args: false,
      parse_double_dash: true,
      flags: [
        verbosity: [
          short: "-v",
          long: "--verbose",
          help: "Specifies verbosity level when executing commands",
          global: true
        ],
        simulated: [
          short: "-s",
          long: "--simulated",
          help:
            "Simulates script execution to allow user to see file changes the applet would make."
        ]
      ],
      subcommands: [
        setup: [
          name: "setup",
          about: "Sets up new Obsidian vault",
          args: [
            name: [
              value_name: "NAME",
              help: "Name of vault",
              required: true
            ],
            path: [
              value_name: "PATH",
              help: "Path where the new vault will be created",
              required: true
            ]
          ]
        ]
      ]
    )
    |> Optimus.parse!(argv)
    |> IO.inspect()
  end
end
