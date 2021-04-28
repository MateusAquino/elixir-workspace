# Syntactic Sugar (parecido com o do Python)

# Básico
## Listas
IO.inspect list = [1, 2, 3, 4, 5]
IO.inspect for x <- list, do: x*x

## Listas com Palavras Chave
IO.inspect for {_key, val} <- [one: 1, two: 2, three: 3], do: val

## Maps
IO.inspect for {k, v} <- %{"k1" => "v1", "k2" => "v2"}, do: {k, v}

## Binaries
IO.inspect for <<c <- "abcde">>, do: <<c>>


# Generators
IO.inspect for {:ok, val} <- [ok: "Hello", error: "Unknown", ok: "World"], do: val

IO.inspect for n <- [1, 2, 3, 4], times <- 1..n, do:
  String.duplicate("*", times)


# Filtros (versão do Guard para Comprehensions)
import Integer
IO.inspect for x <- 1..10, is_even(x), do: x
IO.inspect for x <- 1..100, is_even(x), rem(x, 7) == 0, do: x


# :into
# Generator (produzir mas não necessariamente uma lista)
IO.inspect for {k, v} <- [one: 1, two: 2, three: 3], do: {k, v}
IO.inspect for {k, v} <- [one: 1, two: 2, three: 3], into: %{}, do: {k, v}

"Exemplo" |> String.to_charlist |> Enum.each(&(IO.write("#{&1}, ")))
IO.inspect for c <- [69, 120, 101, 109, 112, 108, 111], into: "", do: <<c>>
