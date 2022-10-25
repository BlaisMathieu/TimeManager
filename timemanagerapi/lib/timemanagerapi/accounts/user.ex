defmodule Timemanagerapi.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :firstName, :string
    field :lastName, :string
    # has_many :tasks, Timemanagerapi.Tasks.Task
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:firstName, :lastName])
    |> validate_required([:firstName, :lastName])
  end
end
