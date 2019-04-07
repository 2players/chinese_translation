defmodule Han.Mixfile do
  use Mix.Project

  @version File.cwd!() |> Path.join("version") |> File.read!() |> String.trim()
  @repo_url "https://github.com/2players/han"
  @doc_url "https://hexdocs.pm/han"

  def project do
    [
      app: :han,
      version: @version,
      elixir: "~> 1.8",
      description: description(),
      package: package(),
      start_permanent: Mix.env() == :prod,
      deps: deps(),

      # exdoc
      name: "Han",
      source_url: @repo_url,
      homepage_url: @repo_url,
      docs: [
        main: "Han",
        extras: ["README.md"]
      ]
    ]
  end

  def application do
    [extra_applications: [:logger]]
  end

  defp deps do
    [
      {:httpoison, "~> 1.4"},
      {:credo, "~> 0.8", only: [:dev, :test]},
      {:ex_doc, "~> 0.19", only: [:dev, :test]},
      {:pre_commit_hook, "~> 1.0.6", only: [:dev]},
      {:benchee, "~> 1.0", only: [:dev]}
    ]
  end

  defp description do
    """
    Utils for processing chinese.
    """
  end

  defp package do
    [
      files: ["lib", "priv", "mix.exs", "README*", "LICENSE*", "version"],
      licenses: ["MIT"],
      maintainers: ["m31271n"],
      links: %{
        "GitHub" => @repo_url,
        "Docs" => @doc_url
      }
    ]
  end
end
