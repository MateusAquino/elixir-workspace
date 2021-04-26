# PrettyPrint
defmodule Sys do
  def log(str) do
    IO.puts IO.ANSI.format([:bright, str])
  end
end
