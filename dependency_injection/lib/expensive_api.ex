require Logger

defmodule MoneyBurner do
  @callback burn_money(any()) :: {:ok, any()}
  def burn_money(query) do
    Process.sleep(100 + :rand.uniform(200))
    Logger.warn("💸🔥 💸🔥 💸🔥")

    {:ok, query}
  end
end
