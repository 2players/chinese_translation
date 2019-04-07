defmodule Han.Utils do
  @moduledoc """
  Utility functions.
  """
  def data_path do
    :han
    |> Application.app_dir()
    |> Path.join("priv")
  end
end
