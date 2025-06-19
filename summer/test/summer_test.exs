defmodule SummerTest do
  use ExUnit.Case
  doctest Summer

  test "greets the world" do
    assert Summer.hello() == :world
  end
end
