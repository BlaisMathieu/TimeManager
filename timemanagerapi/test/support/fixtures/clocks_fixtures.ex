defmodule Timemanagerapi.ClocksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Timemanagerapi.Clocks` context.
  """

  @doc """
  Generate a clock.
  """
  def clock_fixture(attrs \\ %{}) do
    {:ok, clock} =
      attrs
      |> Enum.into(%{

      })
      |> Timemanagerapi.Clocks.create_clock()

    clock
  end
end
