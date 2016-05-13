defmodule EctoPerformance.Mixfile do
  use Mix.Project

  def project do
    [app: :ecto_performance,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [:logger, :postgrex, :ecto],
      mod: {EctoPerformance, []}
    ]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:postgrex, "~> 0.11"},
      {
        :ecto, git: "https://github.com/elixir-lang/ecto.git",
               tag: "v2.0.0-rc.5"
      },
      {:remix, "~> 0.0.1", only: :dev},
      {:poison, "~> 2.0"}
    ]
  end
end
