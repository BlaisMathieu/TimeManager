defmodule Timemanagerapi.TasksFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Timemanagerapi.Tasks` context.
  """

  @doc """
  Generate a taks.
  """
  def taks_fixture(attrs \\ %{}) do
    {:ok, taks} =
      attrs
      |> Enum.into(%{

      })
      |> Timemanagerapi.Tasks.create_taks()

    taks
  end

  @doc """
  Generate a task.
  """
  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(%{

      })
      |> Timemanagerapi.Tasks.create_task()

    task
  end
end
