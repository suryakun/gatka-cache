defmodule GatkaTest do
  use ExUnit.Case
  doctest Gatka

  test "greets the world" do
    assert Gatka.hello() == :world
  end
end
