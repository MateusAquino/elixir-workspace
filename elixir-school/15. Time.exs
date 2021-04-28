# Módulos que trabalham com tempo

# Time
Sys.log "Time:"
now = Time.utc_now
IO.inspect    now
IO.puts "   #{now}"

IO.puts "h: #{now.hour}" # -> GMT-0/UTC
IO.puts "m: #{now.minute}"
# IO.puts "d: #{now.day}" -> não funciona por ser apenas Time
{:ok, t} = Time.new(20,35,40)
IO.inspect t === ~T[20:35:40] # true


# Date
Sys.log "Date:"
today = Date.utc_today
IO.inspect    today
IO.puts "   #{today}"

IO.puts "d: #{today.day}" # -> GMT-0/UTC

{:ok, d} = Date.new(2021,04,28)
IO.inspect d === ~D[2021-04-28] # true
IO.inspect d |> Date.leap_year? # ano bissexto (false)


# NaiveDateTime
Sys.log "NaiveDateTime:"
today_now = NaiveDateTime.utc_now
IO.inspect today_now

{:ok, ndt} = NaiveDateTime.new(d, t)
IO.inspect ~N[2021-04-28 20:35:40] === ndt # true
IO.inspect ~N[2021-04-28 20:35:50] === ndt |> NaiveDateTime.add(10) # true


# DateTime (Suporte à fusos)
# com Tzdata -> config :elixir, :time_zone_database, Tzdata.TimeZoneDatabase
#         ou -> Calendar.put_time_zone_database(Tzdata.TimeZoneDatabase)
Sys.log "DateTime:"
{:ok, dt} = DateTime.from_naive(ndt, "Etc/UTC")
IO.inspect dt
IO.inspect ~U[2021-04-28 20:35:40Z] === dt  # true
IO.inspect ~U[2021-04-28 20:35:40Z] === ndt # false

# Utilizando o Tzdata (no mix):
# IO.inspect dt
# IO.inspect dt |> DateTime.shift_zone("America/New_York")
