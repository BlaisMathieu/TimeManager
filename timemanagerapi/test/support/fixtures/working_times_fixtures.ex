defmodule Timemanagerapi.WorkingTimesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Timemanagerapi.WorkingTimes` context.
  """

  @doc """
  Generate a workingtime.
  """
  def workingtime_fixture(attrs \\ %{}) do
    {:ok, workingtime} =
      attrs
      |> Enum.into(%{

      })
      |> Timemanagerapi.WorkingTimes.create_workingtime()

    workingtime
  end
end
