# Funções Anônimas
somar1 = fn (a, b) -> a + b end
IO.puts "2 + 3 = #{somar1.(2,3)}"

# Taquigrafia
somar2 = &(&1 + &2)
IO.puts "4 + 5 = #{somar2.(4,5)}"

# Pattern Matching
handle = fn
  {:ok, result} -> "Recebi #{result}!"
  {:ok, _} -> "Essa linha nunca vai ser executada"
  {:error} -> "Erro indefinido!"
end

IO.puts handle.({:ok, 1})
IO.puts handle.({:error})

# Funções Nomeadas
defmodule Matematica do
  def somar3(a, b), do: a + b
end

IO.puts "6 + 8 = #{Matematica.somar3(6,8)}"

# Recursão + Pattern Matching
defmodule Tamanho do
  def de([]), do: 0
  def de([_ | tail]), do: 1 + de(tail)
end
IO.puts "0: #{Tamanho.de([])}"
IO.puts "3: #{Tamanho.de([1, 2, 3])}"

# Aridade
defmodule Ex do
  def com, do: "zero"             # com/0
  def com(_um), do: "um"          # com/1
  def com(_um, _dois), do: "dois" # com/2
end
IO.puts Ex.com()
IO.puts Ex.com(0)
IO.puts Ex.com(nil, nil)

# Pattern Matching nas funções
defmodule Bomdia1 do
  def para(%{name: username}), do:
    IO.puts "Bom dia1, " <> username
end
defmodule Bomdia2 do
  def para(%{name: username} = pessoa) do
    IO.puts "Bom dia2, " <> username
    IO.inspect pessoa
  end
end

user = %{name: "Mateus", age: 18}
Bomdia1.para(user)
Bomdia2.para(user)

# Guards & Argumentos padrão
defmodule Restringir do
  def idade(n) when is_integer(n) and n >= 18, do: "Maior de idade"
  def idade(n) when is_integer(n), do: "Menor de idade"
  def idade(n \\ "?"), do: n
end

IO.puts Restringir.idade(19)
IO.puts Restringir.idade(5)
IO.puts Restringir.idade("oi")
IO.puts Restringir.idade()
