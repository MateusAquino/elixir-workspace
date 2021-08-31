defmodule DependencyInjectionTest do
  use ExUnit.Case
  doctest DependencyInjection

  test "greets the world" do
    assert DependencyInjection.hello() == :world
  end
end
