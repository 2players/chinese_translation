defmodule Han.Translate.Util do
  @moduledoc """
  Utility functions to read s2t_conversion.txt file and parse it into a list
  ordered by the length of the words.
  """

  alias Han.Utils

  # .*? no-greedy match ;)
  @php_regex ~r/\$(?<name>\S+).*?\[(?<content>[^\]]*)\]/s
  @php_kv ~r/'(?<key>[^']+)'\s*=>\s*'(?<value>[^']+)'/

  def get_trans_data do
    Utils.data_path()
    |> Path.join("s2t_conversion.txt")
    |> get_file_content
    |> match
    |> Enum.into(%{}, fn [_whole, name, content] ->
      {name, parse(content)}
    end)
    |> Map.get("zh2Hant", [])
  end

  defp get_file_content(filename) do
    case File.read(filename) do
      # silently do nothing
      {:error, _} ->
        ""

      {:ok, content} ->
        content
    end
  end

  defp match(content) do
    Regex.scan(@php_regex, content)
  end

  defp parse(content) do
    @php_kv
    |> Regex.scan(content)
    |> Enum.map(fn [_whole, simp, trad] ->
      {simp, trad}
    end)
    |> sort
  end

  defp sort(data) do
    data
    |> Enum.sort(fn {k1, _}, {k2, _} ->
      String.length(k1) > String.length(k2)
    end)
  end
end
