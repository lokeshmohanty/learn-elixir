defmodule WebApp.MixProject do
  use Mix.Project

  def project do
    [
      app: :web_app,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {WebApp, []},
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [ {:cowboy, "~>1.0.0"}, ]
  end
end
