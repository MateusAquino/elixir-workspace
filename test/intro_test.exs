defmodule IntroTest do
  use ExUnit.Case
  doctest Intro

  test "default 'greets the world' for `mix new intro`" do
    assert Intro.hello() == :world
  end
end
