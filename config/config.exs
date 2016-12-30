# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :elico,
  ecto_repos: [Elico.Repo]

# Configures the endpoint
config :elico, Elico.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "AAkGQDbmdlqE+446TxuVNKADgLiS527NvObLVUiZvsdx+9VaF26H9VtRtenfA/Mp",
  render_errors: [view: Elico.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Elico.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
