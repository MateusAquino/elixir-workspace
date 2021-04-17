# Listas
IO.puts "-- Lists --"
list = [3.14, :torta, "Maçã"]

IO.inspect list

# Prepend (rápido)
IO.inspect ["π" | list]

# Append (lento)
IO.inspect list ++ ["Cherry"]

# Concat lists
list1 = [1, 2, 3]
list2 = [4, 5, 6]
IO.inspect list1 ++ list2

# Subtract lists
list1 = [1, 2, 2, 3]
list2 = [2, 4, 5, 5]
list3 = [2, 2, 5, 5]
IO.inspect list1 -- list2
IO.inspect list1 -- list3


# HEAD | TAIL
IO.puts "\n-- HEAD | TAIL --"
head = hd list
IO.puts "#{ head }: #{ (hd list) === 3.14 }"
tail = tl list
#          vvvvvvvvvvvvvvvvv had no idea how to print a list w/o breaking line, so i created this monster
map_tail = Enum.map(tail, &(
  cond do
    is_bitstring(&1) -> "\"#{&1}\""
    is_atom(&1) -> ":#{&1}"
    true -> &1
  end
))
IO.puts "[#{ Enum.join(map_tail, ", ") }]: #{ (tl list) === [:torta, "Maçã"] }"


# Pattern Matching (alike desestructuring)
IO.puts "\n-- Pattern Matching --"
[head | tail] = list
IO.puts head
IO.inspect tail


# Tuplas
# boa pra checar tamanho, péssima para modificar
IO.puts "\n-- Tuplas --"
tuple = {3.14, :torta, "Maçã"}
IO.inspect tuple
{ num, atom, string } = tuple
IO.inspect num
IO.inspect atom
IO.inspect string


# Listas de palavras chave (<3?)
IO.puts "\n-- Key/Value lists --"
colecao1 = [  abc: 123,    def: 456 ]
colecao2 = [{:abc, 123}, {:def, 456}]
colecao3 = [  def: 456,    abc: 123 ]
colecao4 = [  def: 456,    abc: 123, abc: 123 ]
IO.inspect colecao1
IO.inspect colecao2
IO.inspect colecao3
IO.inspect colecao4

# Chaves são átomos
IO.puts "colecao1 === colecao2: #{ colecao1 === colecao2 }"

# Chaves estão ordenadas
IO.puts "colecao1 === colecao3: #{ colecao1 === colecao3 }"

# Chaves não são únicas
IO.puts "colecao3 === colecao4: #{ colecao3 === colecao4 }"


# Mapas (<3)
# Diferente da anterior, os mapas NÃO são ordenados e
# POSSUEM chaves únicas e NÃO NECESSARIAMENTE possuem átomos em suas chaves
# A partir da 1.2 você pode utilizar variáveis como keys
IO.puts "\n-- Mapas --"
key = :abc
mapa1 = %{ :abc => 123,  456 => :def }
mapa2 = %{  456 => :def, key => :estevalorserasobreescrito, key => 123  }
IO.inspect mapa1
IO.inspect mapa2

IO.puts "mapa1 === mapa2: #{ mapa1 === mapa2 }"
IO.puts "mapa1.abc: #{ mapa1.abc }"
IO.puts "appending: #{ Map.put(mapa1, :teste, 789).teste }"
