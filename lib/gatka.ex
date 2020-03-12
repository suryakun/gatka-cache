defmodule Gatka do
  @moduledoc """
  Documentation for `Gatka`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Gatka.hello()
      :world

  """
  def hello do
    :world
  end

  def store_token(key, token) do
    Cachex.put(:reset_token, key, token)
    Cachex.expire(:reset_token, key, :timer.minutes(3))
  end

  def get_token(key) do
    Cachex.get(:reset_token, key)
  end

  def check_token(key) do
    Cachex.exists?(:reset_token, key)
  end
end
