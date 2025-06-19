defmodule Summer.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Summer.Worker.start_link(arg)
      # {Summer.Worker, arg}
      Supervisor.child_spec({CounterServer, {"0", :cats}}, id: :cats_counter),
      Supervisor.child_spec({CounterServer, {"0", :dogs}}, id: :dogs_counter),
      Supervisor.child_spec({CounterServer, {"0", :parrots}}, id: :parrots_counter),
      Supervisor.child_spec({CounterServer, {"0", :rabbits}}, id: :rabbits_counter),
      Supervisor.child_spec({CounterServer, {"0", :pirates}}, id: :pirates_counter)
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Summer.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
