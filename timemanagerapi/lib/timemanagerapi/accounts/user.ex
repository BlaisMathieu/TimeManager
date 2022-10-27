defmodule Timemanagerapi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :username, :string
    field :email, :string
    has_many :clocks, Timemanagerapi.Clocks.Clock
    has_many :workingtimes, Timemanagerapi.WorkingTimes.Workingtime
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:username, :email])
    |> validate_required([:username, :email])
  end
end
