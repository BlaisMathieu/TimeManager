defmodule Timemanagerapi.Repo.Migrations.WorkingtimesCreation do
  use Ecto.Migration

  def change do
    create table(:workingtimes) do
      add(:start, :utc_datetime, null: false)
      add(:end, :utc_datetime, null: false)
      add :user_id, references(:users)
    end
  end
end
