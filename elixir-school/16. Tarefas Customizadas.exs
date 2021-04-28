# Este arquivo é apenas para consulta, não executará pois
# este repositório *não* utiliza a extrutura mix.

# lib/hello.ex
defmodule Hello do
  @doc """
  Outputs `Hello, World!` every time.
  """
  def say do
    IO.puts("Hello, World!")
  end
end

# hello/lib/mix/tasks/hello.ex
defmodule Mix.Tasks.Hello do
  use Mix.Task

  @shortdoc "Simply calls the Hello.say/0 function."
  def run(_) do
    # Isso inicializará nossa aplicação
    Mix.Task.run("app.start")

    # Chamando a função Hello.say() definida anteriormente
    Hello.say()
  end
end

# Assim, após compilado é possível executar a task com:
# $ mix hello
