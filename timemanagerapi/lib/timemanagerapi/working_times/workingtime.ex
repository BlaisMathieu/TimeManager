defmodule Timemanagerapi.WorkingTimes.Workingtime do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workingtimes" do
    field(:start, :utc_datetime)
    field(:end, :utc_datetime)
    belongs_to :user, Timemanagerapi.Accounts.User
  end

  @doc false
  def changeset(workingtime, attrs, user_id) do
    workingtime
    |> cast(attrs, [:start, :end])
    |> cast(%{user_id: user_id}, [:user_id])
    |> validate_required([:start, :end])
  end

  def _changeset(workingtime, attrs) do
    workingtime
    |> cast(attrs, [:start, :end])
    |> validate_required([:start, :end])
  end
end
