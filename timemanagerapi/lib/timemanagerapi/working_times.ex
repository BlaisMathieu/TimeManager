defmodule Timemanagerapi.WorkingTimes do
  @moduledoc """
  The WorkingTimes context.
  """

  import Ecto.Query, warn: false
  alias Timemanagerapi.Repo

  alias Timemanagerapi.WorkingTimes.Workingtime

  def list_workingtimes do
    Repo.all(Workingtime)
  end

  def get_workingtimes!(id) do
    q = from m in Workingtime, where: m.user_id == ^id
    Repo.all(q)
  end

  def get_userworkingtime!(id, userID) do
    q = from m in Workingtime, where: m.user_id == ^userID and m.id == ^id
    Repo.all(q)
  end


  def get_workingtime!(id), do: Repo.get!(Workingtime, id)

  def create_workingtime(attrs \\ %{}, user_id) do
    %Workingtime{}
    |> Workingtime.changeset(attrs, user_id)
    |> Repo.insert()
  end

  def update_workingtime(%Workingtime{} = workingtime, attrs) do
    workingtime
    |> Workingtime._changeset(attrs)
    |> Repo.update()
  end

  def delete_workingtime(%Workingtime{} = workingtime) do
    Repo.delete(workingtime)
  end

  def change_workingtime(%Workingtime{} = workingtime, attrs \\ %{}) do
    Workingtime.changeset(workingtime, attrs)
  end
end
