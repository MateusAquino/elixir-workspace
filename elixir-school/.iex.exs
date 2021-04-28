# 17. IExHelpers

# Um arquivo .iex.exs é executado no iex sempre quando iniciado (sem necessidade de importar)
defmodule IExHelpers do
  def whats_this?(term) when is_nil(term), do: "Type: Nil"
  def whats_this?(term) when is_binary(term), do: "Type: Binary"
  def whats_this?(term) when is_boolean(term), do: "Type: Boolean"
  def whats_this?(term) when is_atom(term), do: "Type: Atom"
  def whats_this?(_term), do: "Type: Unknown"
end

# h <modulo>
# Obtem a doc do módulo

# i <modulo>
# Obtem informações do módulo/datatype

# r <modulo>
# Recompilar módulo

# t <módulo>
# Tipos disponíveis de um módulo (ex.: `$ t Map`)
