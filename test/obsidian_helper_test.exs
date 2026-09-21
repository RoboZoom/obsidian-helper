defmodule ObsidianHelperTest do
  use ExUnit.Case
  doctest ObsidianHelper

  test "greets the world" do
    assert ObsidianHelper.hello() == :world
  end
end
