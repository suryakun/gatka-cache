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
    case Cachex.get(:reset_token, key) do
      {:ok, token} -> {:ok, token}
      {:ok, nil} -> {:error, nil}
    end
  end

  def check_token(key) do
    case Cachex.exists?(:reset_token, key) do
      {:ok, true} -> {:ok, true}
      {:ok, false} -> {:error, false}
    end
  end

  def delete_token(key) do
    case Cachex.del(:reset_token, key) do
      {:ok, true} -> {:ok, key}
      {:ok, nil} -> {:error, nil}
    end
  end
end
