# SIGILS

# ~C Gera uma lista de caracteres sem escape ou interpolação
# ~c Gera uma lista de caracteres com escape e interpolação
# ~R Gera uma expressão regular sem escape ou interpolação
# ~r Gera uma expressão regular com escape e interpolação
# ~S Gera strings sem escape ou interpolação
# ~s Gera string com escape e interpolação
# ~W Gera uma lista sem escape ou interpolação
# ~w Gera uma lista com escape e interpolação
# ~N Gera uma NaiveDateTime struct
# Uma lista de delimitadores inclui:

# <...> Um par de brackets
# {...} Um par de chaves
# [...] Um par de colchetes
# (...) Um par de parênteses
# |...| Um par de pipes
# /.../ Um par de barras
# "..." Um par de aspas duplas
# '...' Um par de aspas simples

# Exemplos:
# ~c
Sys.log '~c:'
IO.puts ~c'1 + 1 = #{1+1}'
IO.puts ~C'1 + 1 = #{1+1}'
IO.inspect ~c'1 + 1 = #{1+1}'

# ~r
Sys.log "~r:"
rgx1 = ~r|abc|
rgx2 = ~R<abc>
IO.inspect rgx2
IO.puts rgx1 === rgx2 # true
rgx = ~r/ab*c{2}/
IO.puts "acc" =~ rgx # true
IO.puts "abb" =~ rgx # false

# ~s
Sys.log "~s:"
IO.puts ~s"1 + 1 = #{1+1}"
IO.puts ~S"1 + 1 = #{1+1}"
IO.inspect ~s"1 + 1 = #{1+1}"

# ~w
Sys.log "~w:"
x1 = ~w[Exemplo de Lista de Palavras #{1 + 1}]
x2 = ~W[Exemplo de Lista de Palavras #{1 + 1}]
IO.inspect x1
IO.inspect x2

# ~N
Sys.log "~N"
ndt = ~N[2021-04-27 19:10:00]
IO.puts ndt
IO.inspect ndt
IO.puts NaiveDateTime.from_iso8601("2015-01-23 23:50:07") === {:ok, ~N[2015-01-23 23:50:07]}

# Custom
Sys.log "Custom"
defmodule MySigils do
  def sigil_z(string, []), do: String.upcase(string)
end

defmodule Main do
  def main do
    import MySigils
    IO.puts ~z|exemplo|
    IO.inspect ~z|exemplo|
  end
end
Main.main()
