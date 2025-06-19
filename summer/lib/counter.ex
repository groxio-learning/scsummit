defmodule Counter do
  @moduledoc """
  A functional core for counter operations with pure functions.
  """

  @doc """
  Constructor that accepts a string input and returns an integer.
  """
  def new(initial_value) when is_binary(initial_value) do
    String.to_integer(initial_value)
  end

  @doc """
  Increments the accumulator by 1.
  """
  def inc(accumulator) when is_integer(accumulator) do
    accumulator + 1
  end

  @doc """
  Decrements the accumulator by 1.
  """
  def dec(accumulator) when is_integer(accumulator) do
    accumulator - 1
  end

  @doc """
  Returns a string with the accumulator embedded.
  """
  def show(accumulator) when is_integer(accumulator) do
    "Current count: #{accumulator}"
  end
end
