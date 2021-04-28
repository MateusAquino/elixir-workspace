# Strings (sequência de bytes)
Sys.log "Strings:"
string = <<69, 120, 101, 109, 112, 108, 111>>
IO.puts string
IO.inspect string
IO.puts string <> <<0>>
IO.inspect string <> <<0>>
## Ao usar a sintaxe com « » estamos dizendo ao compilador que os elementos dentro desses símbolos são bytes.


# Listas de Caracteres
# " -> Strings        -> UTF-8
# ' -> Lista de Chars -> Número Unicode
Sys.log "Lista de Caracteres:"
IO.inspect 'hełło'
IO.inspect "hełło" <> <<0>>
# Exemplo - ł:
#  em UTF-8  : 322
#  em Unicode: 197 + 130
# Pegar codepoint:
IO.inspect 'ł' === 322 # false
IO.inspect ?ł  === 322 # true


# Graphemes e Codepoints
Sys.log "Graphemes e Codepoints:"
str = "\u0061\u0301"
IO.inspect String.codepoints str # ["a", "́"]
IO.inspect String.graphemes  str # ["á"]


# Módulo String
Sys.log "Módulo String:"

IO.inspect String.length "Olá" # 3
IO.inspect String.replace("Olá", "lá", "i") # Oi
IO.inspect String.duplicate("bodia ", 3) # "bodia bodia bodia "
IO.inspect String.split("ABC", "B") # ["A", "C"]


# Exercícios :)
Sys.log "Exercícios:"
IO.puts "Anagrama"

# O exemplo da elixirschool utiliza sorting (Enum#sort/1), eu preferi
# fazer subtraindo listas com o operador :erlang.--/2
defmodule Ex do
  def anagrama(str1, str2) do
    list1 = str1 |> to_list
    list2 = str2 |> to_list
    is_anagrama(list1 -- list2, list2 -- list1)
  end
  defp to_list(str) when is_binary(str), do: str |> String.downcase |> String.graphemes()
  defp is_anagrama(_ = [], _ = []), do: true
  defp is_anagrama(_, _), do: false
end

IO.puts Ex.anagrama("Topa", "pato")   # true
IO.puts Ex.anagrama("amor", "amor")   # true
IO.puts Ex.anagrama("ámoor", "roomá") # true
IO.puts Ex.anagrama("top", "pato")   # false
IO.puts Ex.anagrama("amoor", "roma") # false
IO.puts Ex.anagrama("amor", "rooma") # false
