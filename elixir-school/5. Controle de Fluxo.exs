Sys.log "if e unless:"
if String.valid?("hello") do
  IO.puts "Valid String"
else
  IO.puts "Invalid String"
end
IO.puts if     "some string", do: "truthy", else: "falsy"
IO.puts unless "some string", do: "truthy", else: "falsy"


Sys.log "case:"
case {:ok, "Nyanpasu"} do
  {:ok, value} -> value
  {:error} -> "Oh no!"
  _ -> "Catchin' everything"
end |> IO.puts

case :odd do
  :even -> "is even"
  _ -> "is not even"
end |> IO.puts

# Cláusulas de Guarda
case {1, 2, 3} do
  {1, x, 3} when x > 1 -> ":)"
  _ -> ":("
end |> IO.puts


Sys.log "cond:"
cond do
  2 + 2 === 5 -> "Won't be true"
  2 * 2 === 3 -> "Same"
  1 + 1 === 2 -> "But this will"
  true -> "Catchin' everything"
end |> IO.puts


Sys.log "with:"
user = %{name: "Mafios", id: 1972} # WORKS
with {:ok, name} <- Map.fetch(user, :name),
     {:ok, id}   <- Map.fetch(user, :id),
  do: "Tag: #{name}##{id}"
|> IO.puts

user = %{name: "Mafios"} # FAILS
with {:ok, name} <- Map.fetch(user, :name),
     {:ok, id}   <- Map.fetch(user, :id)
  do "Tag: #{name}##{id}"
end |> IO.inspect

user = %{name: "Mafios"} # FAILS w/ ELSE
with {:ok, name} <- Map.fetch(user, :name),
     {:ok, id}   <- Map.fetch(user, :id)
  do "Tag: #{name}##{id}"
else
  err -> {err, "Invalid User"}
end |> IO.inspect
