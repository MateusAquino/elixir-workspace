defmodule Namespace.ModuleName do
  def func_name(param) do
    "Hello #{param}."
  end
end

param = "Mateus"
Namespace.ModuleName.func_name(param) |> IO.puts

# Atributos de Módulos (constantes)
defmodule Example do
  @atributo "valor"
  def get, do: "@atributo: #{@atributo}"
end
Example.get |> IO.puts

# Structs (igual nos Changesets)
defmodule Caixa do
  @derive {Inspect, only: [:serie, :conteudo]}
  # ou @derive {Inspect, except: [:esse_campo_eh_segredo]}
  defstruct serie: "ID-????", conteudo: [], esse_campo_eh_segredo: 123
end
defmodule Run do
  def main do
    IO.inspect %Caixa{} === %Caixa{}
    IO.inspect %Caixa{}
    IO.inspect %Caixa{serie: "ID-0001"}
    IO.inspect %Caixa{serie: "ID-0002", conteudo: [:queijo, :pão, :farinha]}
  end
end
Run.main()

# Composição
defmodule Namespace.Muito.Grande.ModuleName do
  def oi, do: "oi"
end
alias Namespace.Muito.Grande.ModuleName
alias Namespace.ModuleName, as: Pseudonimo
IO.puts ModuleName.oi
IO.puts Pseudonimo.func_name("Mat")

# Import (em vez de criar pseudonimos)
import List, only: [last: 1] # ", only: [nome: aridade]" é opcional
                             # ", except: [nome: aridade]" também poderia ser usado
IO.puts last([1, 2, 3]) # List.last/1

# Require (não entendi a diferença do import, mas funciona aparentemente igual)
defmodule Example2 do
  require List

  IO.puts List.first([1,2,3])
end

# Macros (funciona como um extends)
defmodule Hello do
  defmacro __using__(_opts) do
    quote do
      def hello(name), do: "Hi, #{name}"
    end
  end
end

defmodule UsarMacro do
  use Hello
end

IO.puts UsarMacro.hello("Mateus")

# Macros pt.2 (com opções)
defmodule Hello2 do
  defmacro __using__(opts) do
    greeting = Keyword.get(opts, :traduzir, "Hi")

    quote do
      def hello(name), do: unquote(greeting) <> ", " <> name
    end
  end
end

defmodule UsarMacro2 do
  use Hello2, traduzir: "Hola"
end

IO.puts UsarMacro2.hello("Mateus")
