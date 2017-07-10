# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :json_api,
  ecto_repos: [JsonApi.Repo]

# Configures the endpoint
config :json_api, JsonApi.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "67qt7bvqRNdWmTs/gEowZ/JrIqP2gCMxVmfvp5u2hcC52IygvhpRVOFGOijfqHdH",
  render_errors: [view: JsonApi.ErrorView, accepts: ~w(html json)],
  pubsub: [name: JsonApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

config :ja_serializer,
  key_format: :underscored

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :format_encoders,
  "json-api": Poison

config :mime, :types, %{
  "application/vnd.api+json" => ["json-api"]
}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
