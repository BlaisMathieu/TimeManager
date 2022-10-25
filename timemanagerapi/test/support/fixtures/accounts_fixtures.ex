defmodule Timemanagerapi.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Timemanagerapi.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{

      })
      |> Timemanagerapi.Accounts.create_user()

    user
  end

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        firstName: "some firstName",
        lastName: "some lastName"
      })
      |> Timemanagerapi.Accounts.create_user()

    user
  end
end
