# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :backend,
  ecto_repos: [Backend.Repo]

# Configures the endpoint
config :backend, BackendWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lzZBvVE8VS2FrU6DdFHZkAVJ5CLVNu9+HEW5EIiG/hmipN9cTpXa4awQuHfXcVrN",
  render_errors: [view: BackendWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Backend.PubSub,
  live_view: [signing_salt: "to9lLp2G"],
  cors: [
    origins: ["http//localhost:3000"],
    allowed_methods: ["GET", "POST", "OPTIONS"],
    allowed_headers: ["content-type", "authorization"],
    max_age: 600
  ]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
