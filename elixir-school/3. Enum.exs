# Enumeráveis
# Com exceção das tuplas, todas as coleções são enumeráveis

# List fn's
#Enum.__info__(:functions) |>
#  Enum.each(fn({f, arity}) ->
#    IO.puts "#{f}/#{arity}"
#  end)

list = ["hey", "foo", "hello", "bar"]

Sys.log "Enum#all?:"
IO.puts Enum.all?(list, fn (s) -> String.length(s) == 3 end)
IO.puts Enum.all?(list, fn (s) -> String.length(s) > 1 end)

Sys.log "Enum#any?:"
IO.puts Enum.any?(list, fn (s) -> String.length(s) === 5 end)

Sys.log "Enum#chunk_every:" # quebra a coleção em pequenos grupos
IO.inspect Enum.chunk_every(list, 2)

Sys.log "Enum#chunk_by:" # quebra a coleção em pequenos grupos com caracteristicas iguais (apenas se estiverem perto)
IO.inspect Enum.chunk_by(list, &(String.length(&1)))

Sys.log "Enum#map_every:" # igual o Enum#map, porém para intervalos diferentes (igual o Enum#chunk_every)
IO.inspect Enum.map_every(list, 2, &(String.length(&1)))

Sys.log "Enum#each:" # .forEach()
retorno = Enum.each(list, fn (s) -> IO.puts s end)
IO.write "Esta função retorna -> "
IO.inspect retorno

Sys.log "Enum#map:"
map_len = Enum.map(list, &(String.length(&1)))
IO.puts Enum.join(map_len, " - ")

Sys.log "Enum#min:"
IO.puts "Menor length: #{ Enum.min(map_len) }"

Sys.log "Enum#max:"
IO.puts "Menor length: #{ Enum.max(map_len) }"

Sys.log "Enum#filter:"
IO.write "Filtrar pares de 1..10: "
IO.inspect Enum.filter(1..10, &(rem(&1, 2) === 0))

Sys.log "Enum#reduce:"
soma = Enum.reduce(1..100, fn (x, acc) -> x + acc end)
IO.puts "Somar números de 1..100: #{soma}"
soma = Enum.reduce(1..100, 2, fn (x, acc) -> x + acc end)
IO.puts "Somar números de 1..100 com acumulador opcional = 2: #{soma}"

# para lembrar: number < atom < reference < function < port < pid < tuple < map < list < bitstring
# also: Enum = um átomo
Sys.log "Enum#sort:"
colecao1 = [5, 6, 1, 3, -1, 4]
colecao2 = [:foo, "bar", Enum, -1, 4]
colecao3 = [%{:val => 4}, %{:val => 1}]
IO.write "Sort em lista padrão: "
IO.inspect Enum.sort(colecao1)
IO.write "Sort em lista com elementos de tipos diferentes: "
IO.inspect Enum.sort(colecao2)
IO.write "Sort em lista sem função: "
IO.inspect Enum.sort(colecao3)
IO.write "Sort em lista com função: "
IO.inspect Enum.sort(colecao3, &(&1[:val] > &2[:val]))

Sys.log "Enum#uniq:" # <3
IO.write "Lista com itens únicos: "
IO.inspect Enum.uniq([0, 1, 2, 2, 1, 4, 3])

Sys.log "Enum#uniq_by:" # <3
techs = ["Node.js", "node.js", "javascript", "NodeJS", "JavaScript "]
# Normaliza em lowercase + sem pontos + trim
normalize = fn str -> String.replace(str, ".", "") |> String.downcase |> String.trim end
IO.write "Lista com itens únicos com função de normalização: "
IO.inspect Enum.uniq_by(techs, normalize)

# Operador capture
Sys.log "Operador Capture:"
fn_anon = fn (ab, cd) -> ab + cd end
fn_capt = &(&1 + &2)
IO.puts "Anon(x, y) === Capt(x, y): #{ fn_anon.(15, 16) === fn_capt.(15, 16) }"

# Operador capture em função nomeada
defmodule Sum do
  def three(number), do: number + 3
end
IO.puts "f(x) = x + 3"
IO.puts "f(2) = 2 + 3: #{ Sum.three(2) }"
IO.write "map([1, 2, 3], &fn(&1)): "
IO.inspect Enum.map(1..3, &Sum.three(&1))
IO.write "map([1, 2, 3], &fn/1): "
IO.inspect Enum.map(1..3, &Sum.three/1)
