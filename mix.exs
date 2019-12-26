defmodule ZeroPhoenix.Mixfile do
  use Mix.Project

  def project do
    [
      app: :zero_phoenix,
      version: "0.0.1",
      elixir: "~> 1.9.4",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      aliases: aliases(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {ZeroPhoenix.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.4.11"},
      {:phoenix_pubsub, "~> 1.1.2"},
      {:phoenix_ecto, "~> 4.1.0"},
      {:ecto_sql, "~> 3.2.2"},
      {:postgrex, "~> 0.15.2"},
      {:phoenix_html, "~> 2.13.3"},
      {:phoenix_live_reload, "~> 1.2.1", only: :dev},
      {:gettext, "~> 0.17.1"},
      {:jason, "~> 1.1.2"},
      {:plug_cowboy, "~> 2.1.0"},
      {:absinthe_plug, github: "absinthe-graphql/absinthe_plug"}
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
      "ecto.reset": ["ecto.drop", "ecto.setup"],
      test: ["ecto.create --quiet", "ecto.migrate", "test"]
    ]
  end
end
