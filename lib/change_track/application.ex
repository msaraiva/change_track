defmodule ChangeTrack.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      ChangeTrackWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: ChangeTrack.PubSub},
      # Start the Endpoint (http/https)
      ChangeTrackWeb.Endpoint
      # Start a worker by calling: ChangeTrack.Worker.start_link(arg)
      # {ChangeTrack.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ChangeTrack.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    ChangeTrackWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
