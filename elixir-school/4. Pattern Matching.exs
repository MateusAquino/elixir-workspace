## Pattern Matching
# Operador Match
IO.puts "OPERADOR MATCH"

# Exemplos
x = 3 + 2
list = [1, 2, 3]
tuple = {:ok, "Sucesso!"}

IO.puts " - Valor:"
try do IO.puts "1: Done [#{5 = x}]" rescue MatchError -> IO.puts "1: Fail" end
try do IO.puts "2: Done [#{7 = x}]" rescue MatchError -> IO.puts "2: Fail" end

IO.puts " - Coleções:"
try do IO.inspect [1, 2, 3] = list rescue MatchError -> IO.puts "Fail" end
try do IO.inspect [] = list rescue MatchError -> IO.puts "Fail" end
try do IO.inspect [1 | tail] = list
  IO.write "tail: "
  IO.inspect tail
rescue MatchError -> IO.puts "Fail" end
try do IO.inspect [2 | _] = list rescue MatchError -> IO.puts "Fail" end

IO.puts " - Tuplas:"
try do IO.inspect {:ok, val} = tuple rescue MatchError -> IO.puts "Fail" end
try do IO.inspect {:ok, val} = {:error} rescue MatchError -> IO.puts "Fail" end

# Operador Pin
IO.puts "\nOPERADOR PIN"
x = 1
try do IO.puts ^x = 1 rescue MatchError -> IO.puts "Fail" end # prints 1
try do IO.puts ^x = 2 rescue MatchError -> IO.puts "Fail" end # prints Fail
{x, ^x} = {2, 1} # da match em ^x = 1 (pinned) mas troca o valor de x para 2
IO.puts x # prints 2

key = "hello"
try do IO.inspect %{^key => value} = %{"hello" => "world"} rescue MatchError -> IO.puts "Fail" end # works
try do IO.inspect %{^key => value} = %{:hello  => "world"} rescue MatchError -> IO.puts "Fail" end # doesn't
