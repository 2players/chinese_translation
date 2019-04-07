defmodule Han do
  alias Han.Pinyin
  alias Han.Slugify
  alias Han.Translate, as: Translate

  @moduledoc """
  Utils for processing chinese.
  """

  @doc ~S"""
  Public function to translate chinese. Example:

      iex> Han.translate("中国")
      "中國"

      iex> Han.translate("中国", :simplified)
      "中國"

      iex> Han.translate("中國", :traditional)
      "中国"

  """
  def translate(content), do: translate(content, :simplified)

  def translate(content, :simplified),
    do: content |> Translate.do_s2t() |> IO.iodata_to_binary()

  def translate(content, :traditional),
    do: content |> Translate.do_t2s() |> IO.iodata_to_binary()

  @doc ~S"""
  Public function to convert Chinese words to pinyin. Example:

      iex> Han.pinyin("中国")
      "zhōng guó"

      iex> Han.pinyin("中国", :simplified)
      "zhōng guó"

      iex> Han.pinyin("中國", :traditional)
      "zhōng guó"

  """

  def pinyin(content), do: pinyin(content, :simplified)

  def pinyin(content, :simplified) do
    content
    |> Pinyin.process()
    |> IO.iodata_to_binary()
    |> String.trim_trailing()
  end

  def pinyin(content, :traditional),
    do: content |> translate(:traditional) |> pinyin

  @doc ~S"""
  Public function to slugify Chinese words. Example:

      iex> Han.slugify("中国")
      "zhong-guo"

      iex> Han.slugify("中國", :traditional)
      "zhong-guo"

      iex> Han.slugify(" *& 46 848 中 ----- 国")
      "46-848-zhong-guo"

      iex> Han.slugify("关于 Elixir 的 HTML5 页面")
      "guan-yu-elixir-de-html5-ye-mian"

  """

  def slugify(content), do: slugify(content, :simplified)

  def slugify(content, :simplified), do: content |> pinyin |> to_slug

  def slugify(content, :traditional),
    do: content |> pinyin(:traditional) |> to_slug

  defp to_slug(data) do
    data
    |> String.split()
    |> Stream.map(&Slugify.process(&1))
    |> Enum.join(" ")
    |> String.downcase()
    |> String.replace(~r/[^a-z0-9]+/, "-")
    |> String.trim("-")
  end
end
