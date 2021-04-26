# PrettyPrint
defmodule Sys do
  def log(str) do
    IO.puts IO.ANSI.format([:bright, "\n#{str}"])
  end
end
