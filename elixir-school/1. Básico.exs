# number < atom < reference < function < port < pid < tuple < map < list < bitstring
name = "Mateus"
IO.puts("Hello world from Elixir @ #{name}' shell")

IO.puts("Count " <> "#{[1]}" <> "#{2}" <> "3")

#                                   hmm cool
# lgcl tstng                        vvvvvv
IO.puts("T: " <> "#{true}" <> "#{42 && nil}" <> " | #{5 == 5.0} | #{5 === 5.0}")

x = :erlang
IO.puts("U: " <> "#{rem(10, 3)} #{div(3, 2)} #{:atom} #{x}")
