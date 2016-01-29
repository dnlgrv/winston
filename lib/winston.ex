defmodule Winston do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Winston.Slack, [])
    ]

    opts = [strategy: :one_for_one, name: Winston.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
