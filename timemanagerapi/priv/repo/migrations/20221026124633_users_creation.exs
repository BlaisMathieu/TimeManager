defmodule Timemanagerapi.Repo.Migrations.UsersCreation do
  use Ecto.Migration

  def change do
    create table(:users) do
      add(:username, :string, null: false)
      add(:email, :string, null: false)
    end
  end
end
