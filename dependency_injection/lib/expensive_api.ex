require Logger

defmodule MoneyBurner do
  @callback burn_money(any()) :: {:ok, any()}
  def burn_money(query) do
    Process.sleep(100 + :rand.uniform(200))
    Logger.warn("πΈπ₯ πΈπ₯ πΈπ₯")

    {:ok, query}
  end
end
