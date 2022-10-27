defmodule Timemanagerapi.Clocks.Clock do
  use Ecto.Schema
  import Ecto.Changeset

  schema "clocks" do
    field(:time, :utc_datetime)
    field(:status, :boolean)
    belongs_to :user, Timemanagerapi.Accounts.User
  end

  @doc false
  def changeset(clock, attrs, user_id) do
    clock
    |> cast(attrs, [:time, :status])
    |> cast(%{user_id: user_id}, [:user_id])
    |> validate_required([:time, :status])
  end
end
