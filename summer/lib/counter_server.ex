defmodule CounterServer do
  use GenServer

  @moduledoc """
  A GenServer that provides a stateful interface to the Counter functional core.
  """

  ## Client API

  @doc """
  Starts the GenServer with an initial value as a string and a name atom.
  """
  def start_link({initial_value, name}) when is_binary(initial_value) and is_atom(name) do
    GenServer.start_link(__MODULE__, initial_value, name: name)
  end

  @doc """
  Shows the current counter value (synchronous call).
  """
  def show(name) when is_atom(name) do
    GenServer.call(name, :show)
  end

  @doc """
  Increments the counter (asynchronous cast).
  """
  def inc(name) when is_atom(name) do
    GenServer.cast(name, :inc)
  end

  @doc """
  Decrements the counter (asynchronous cast).
  """
  def dec(name) when is_atom(name) do
    GenServer.cast(name, :dec)
  end

  @doc """
  Crashes the GenServer (for demonstration purposes).
  """
  def boom(name) when is_atom(name) do
    GenServer.cast(name, :boom)
  end

  ## Server Callbacks

  @impl true
  def init(initial_value) do
    state = Counter.new(initial_value)
    IO.puts("CounterServer started with state: #{inspect(state)}")
    {:ok, state}
  end

  @impl true
  def handle_call(:show, _from, state) do
    result = Counter.show(state)
    {:reply, result, state}
  end

  @impl true
  def handle_cast(:inc, state) do
    new_state = Counter.inc(state)
    {:noreply, new_state}
  end

  @impl true
  def handle_cast(:dec, state) do
    new_state = Counter.dec(state)
    {:noreply, new_state}
  end

  @impl true
  def handle_cast(:boom, _state) do
    raise "BOOM! The counter exploded!"
  end
end
