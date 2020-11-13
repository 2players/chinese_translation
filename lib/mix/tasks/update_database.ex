defmodule Mix.Tasks.Han.UpdateDatabase do
  @moduledoc """
  Fetch the latest database for Han.
  """

  use Mix.Task

  alias Han.Utils

  @shortdoc "Fetch the latest database for Han."

  @urls [
    {
      "https://raw.githubusercontent.com/janx/ruby-pinyin/master/lib/ruby-pinyin/data/words.dat",
      "pinyin_words.txt"
    },
    {
      "https://raw.githubusercontent.com/janx/ruby-pinyin/master/lib/ruby-pinyin/data/Mandarin.dat",
      "pinyin_characters.txt"
    },
    {
      "https://raw.githubusercontent.com/wikimedia/mediawiki/master/languages/data/ZhConversion.php",
      "s2t_conversion.txt"
    }
  ]

  def run(_) do
    get_data_file(@urls)
    recompile()
  end

  defp get_data_file(urls) do
    urls
    |> Stream.map(&download/1)
    |> Stream.map(&write_file/1)
    |> Enum.to_list()
  end

  defp recompile do
    System.cmd("mix", ["clean"])
    System.cmd("mix", ["compile"])
  end

  defp download({url, filename}) do
    IO.puts("Downloading from #{url}...")
    %HTTPoison.Response{body: body} = HTTPoison.get!(url)
    {filename, body}
  end

  def write_file({filename, body}) do
    path = Path.join(Utils.data_path(), filename)
    File.write(path, body)
  end
end
