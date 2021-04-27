# Pipe (passa um argumento para uma função)
#    foo(bar(baz(new_function(other_function()))))
#  vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
# other_function |> new_function |> baz |> bar |> foo

IO.inspect(String.split("a bc de f"))
IO.inspect "a bc de f" |> String.split()
"a bc de f" |> String.split |> IO.inspect
"a bc de f" |> String.upcase |> String.split |> IO.inspect

IO.inspect "elixir" |> String.ends_with?("ixir")
