defmodule Cache do
  use Agent

  def start_link(args \\ %{}, opts \\ []) do
    args =
      args
      |> Map.put_new(:cache, %{})
      |> Map.put_new(:timers, %{})
      |> Map.put_new(:money_burner, MoneyBurner)

    opts =
      opts
      |> Keyword.put_new(:ttl, 2000)
      |> Keyword.put_new(:name, __MODULE__)

    state = %{
      cache: args[:cache],
      timers: args[:timers],
      money_burner: args[:money_burner],
      ttl: opts[:ttl]
    }

    Agent.start_link(fn -> state end, opts)
  end

  def cheap_read(pid, query) do
    case Agent.get(pid, fn state -> get_in(state, [:cache, query]) end) do
      nil ->
        {:ok, value} = Agent.get(pid, & &1.money_burner).burn_money(query)
        :ok = write(pid, query, value)
        value

      cached ->
        # Renew cache
        :ok = write(pid, query, cached)
        cached
    end
  end

  defp write(pid, query, value) do
    :ok =
      Agent.update(pid, fn state ->
        {:ok, new_timer} = :timer.apply_after(state.ttl, __MODULE__, :pop, [self(), query])

        case get_in(state, [:timers, query]) do
          timer when not is_nil(timer) -> {:ok, :cancel} = :timer.cancel(timer)
          nil -> nil
        end

        state
        |> put_in([:cache, query], value)
        |> put_in([:timers, query], new_timer)
      end)
  end

  @doc false
  def pop(pid, query) do
    :ok =
      Agent.update(pid, fn state ->
        {_pop, state} = pop_in(state, [:cache, query])
        {_pop, state} = pop_in(state, [:timers, query])
        state
      end)
  end
end
