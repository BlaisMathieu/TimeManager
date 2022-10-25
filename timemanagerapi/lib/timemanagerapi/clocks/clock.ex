defmodule Timemanagerapi.Clocks.Clock do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clocks" do
    field(:time, :utc_datetime)
    field(:status, :boolean)
    belongs_to :user, Timemanagerapi.Accounts.User
  end

  @doc false
  def changeset(clock, attrs) do
    clock
    |> cast(attrs, [:time, :status, :user_id])
    |> validate_required([:time, :status, :user_id])
  end
end
