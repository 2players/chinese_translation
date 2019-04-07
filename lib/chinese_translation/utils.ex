defmodule ChineseTranslation.Utils do
  @moduledoc """
  Utility functions.
  """
  def data_path do
    :chinese_translation
    |> Application.app_dir()
    |> Path.join("priv")
  end
end
