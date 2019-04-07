defmodule ChineseTranslation.Pinyin do
  @moduledoc """
  Read the word/character -> pinyin file and generate functions for matching.
  """

  alias ChineseTranslation.Pinyin.Util

  IO.puts("Max word length used by compilation: #{Util.max_word_len()}")

  Util.get_pinyin_data()
  |> Stream.map(fn {ch, pinyin} ->
    def process(unquote(ch) <> rest) do
      unquote(:binary.bin_to_list(pinyin <> " ")) ++ process(rest)
    end
  end)
  |> Enum.to_list()

  def process(<<ch, rest::binary>>) do
    [ch | process(rest)]
  end

  def process("") do
    []
  end
end
