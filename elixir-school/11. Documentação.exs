# Ao compilar é possivel checar a documentação com "h Saudar"
# Execute no terminal:
# $ elixirc "11. Documentação.exs"
# $ iex
# $ h Saudar

defmodule Saudar do
  @moduledoc """
  Provê a função `oi/1` para saudar alguem
  """


  @doc """
  Imprime uma mensagem de Olá.

  ## Parâmetros

    - nome: String que representa o nome da pessoa.

  ## Exemplos

      iex> Saudar.oi("Sean")
      "Olá, Sean"

      iex> Saudar.oi("pete")
      "Olá, pete"

  """
  @spec oi(String.t()) :: String.t()
  def oi(nome) do
    "Olá, " <> nome
  end
end

# Ao utilizar o mix é possível utilizar o ExDoc para gerar um HTML com as deps:
# {:earmark, "~> 1.2", only: :dev},
# {:ex_doc, "~> 0.19", only: :dev}
#
# $ mix deps.get # gets ExDoc + Earmark.
# $ mix docs     # makes the documentation.
