defmodule CacheTest do
  use ExUnit.Case

  import Mox
  Mox.defmock(MoneyBurnerMock, for: MoneyBurner)

  setup do
    ttl = 200
    {:ok, pid} = Cache.start_link(money_burner: MoneyBurnerMock, ttl: ttl)
    {:ok, pid: pid, ttl: ttl}
  end

  test "should read/write from cache" do
    expect(MoneyBurnerMock, :burn_money, 1, &fake_burn/1)
    :query_one = Cache.burn_money(:query_one)
    :query_one = Cache.burn_money(:query_one)
    verify!()
    expect(MoneyBurnerMock, :burn_money, 1, &fake_burn/1)
    :query_two = Cache.burn_money(:query_two)
    verify!()
  end

  test "should read/write should respect & renew ttl cache", %{ttl: ttl} do
    # Caching
    expect(MoneyBurnerMock, :burn_money, 1, &fake_burn/1)
    :query = Cache.burn_money(:query)
    :query = Cache.burn_money(:query)
    verify!()

    # Renew
    expect(MoneyBurnerMock, :burn_money, 0, &fake_burn/1)
    Process.sleep(99 ~>> ttl)
    :query = Cache.burn_money(:query)
    Process.sleep(99 ~>> ttl)
    :query = Cache.burn_money(:query)
    verify!()

    # Expire
    expect(MoneyBurnerMock, :burn_money, 1, &fake_burn/1)
    Process.sleep(101 ~>> ttl)
    :query = Cache.burn_money(:query)
    verify!()
  end

  defdelegate left ~>> right, to: __MODULE__, as: :round_percent
  def round_percent(percent, of), do: round(percent / 100 * of)

  def fake_burn(query), do: query
end
