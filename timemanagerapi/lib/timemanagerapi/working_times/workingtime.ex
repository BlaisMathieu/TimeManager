defmodule Timemanagerapi.WorkingTimes.Workingtime do
  use Ecto.Schema
  import Ecto.Changeset

  schema "workingtimes" do
    field(:start, :utc_datetime)
    field(:end, :utc_datetime)
    belongs_to :user, Timemanagerapi.Accounts.User
  end

  @doc false
  def changeset(workingtime, attrs) do
    workingtime
    |> cast(attrs, [])
    |> validate_required([])
  end
end
