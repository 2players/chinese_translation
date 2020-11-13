defmodule Han.Mixfile do
  use Mix.Project

  @version File.cwd!() |> Path.join("version") |> File.read!() |> String.trim()
  @repo_url "https://github.com/c4710n/ex_han"
  @doc_url "https://hexdocs.pm/han"

  def project do
    [
      app: :han,
      version: @version,
      elixir: "~> 1.7",
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
      {:httpoison, "~> 1.7.0"},
      {:credo, "~> 1.5.1", only: [:dev, :test]},
      {:ex_doc, "~> 0.23.0", only: [:dev, :test]},
      {:pre_commit_hook, "~> 1.2.0", only: [:dev]},
      {:benchee, "~> 1.0.0", only: [:dev]}
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
      links: %{
        "GitHub" => @repo_url,
        "Docs" => @doc_url
      }
    ]
  end
end
