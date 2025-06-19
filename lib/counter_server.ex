defmodule CounterServer do
  use GenServer

  @moduledoc """
  A GenServer that provides a stateful interface to the Counter functional core.
  """

  ## Client API

  @doc """
  Starts the GenServer with an initial value as a string.
  """
  def start_link(initial_value) when is_binary(initial_value) do
    GenServer.start_link(__MODULE__, initial_value, name: __MODULE__)
  end

  @doc """
  Shows the current counter value (synchronous call).
  """
  def show do
    GenServer.call(__MODULE__, :show)
  end

  @doc """
  Increments the counter (asynchronous cast).
  """
  def inc do
    GenServer.cast(__MODULE__, :inc)
  end

  @doc """
  Decrements the counter (asynchronous cast).
  """
  def dec do
    GenServer.cast(__MODULE__, :dec)
  end

  ## Server Callbacks

  @impl true
  def init(initial_value) do
    state = Counter.new(initial_value)
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
end
