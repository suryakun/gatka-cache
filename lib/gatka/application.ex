defmodule Gatka.Application do
  import Supervisor.Spec
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Gatka.Worker.start_link(arg)
      # {Gatka.Worker, arg}
      worker(Cachex, [:reset_token, []])
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Gatka.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
