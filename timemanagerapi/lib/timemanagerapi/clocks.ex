defmodule Timemanagerapi.Clocks do
  @moduledoc """
  The Clocks context.
  """

  import Ecto.Query, warn: false
  alias Timemanagerapi.Repo

  alias Timemanagerapi.Clocks.Clock

  def list_clocks do
    Repo.all(Clock)
  end

  def get_clock!(id), do: Repo.get!(Clock, id)


  def get_clocks!(id) do
    q = from m in Clock, where: m.user_id == ^id
    Repo.all(q)
  end

  def create_clock(attrs \\ %{}, user_id) do
    %Clock{}
    |> Clock.changeset(attrs, user_id)
    |> Repo.insert()
  end

  def update_clock(%Clock{} = clock, attrs) do
    clock
    |> Clock.changeset(attrs)
    |> Repo.update()
  end

  def delete_clock(%Clock{} = clock) do
    Repo.delete(clock)
  end

  def change_clock(%Clock{} = clock, attrs \\ %{}) do
    Clock.changeset(clock, attrs)
  end
end
