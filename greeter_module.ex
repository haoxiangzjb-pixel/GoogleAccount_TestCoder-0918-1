defmodule Greeter do
  @moduledoc """
  Модуль для приветственных сообщений.
  """

  @doc """
  Возвращает приветствие для указанного имени.
  """
  def hello(name) do
    "Hello, #{name}!"
  end
end