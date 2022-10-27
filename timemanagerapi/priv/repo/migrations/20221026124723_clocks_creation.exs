defmodule Timemanagerapi.Repo.Migrations.ClocksCreation do
  use Ecto.Migration

  def change do
    create table(:clocks) do
      add(:time, :utc_datetime, null: false)
      add(:status, :boolean, null: false)
      add :user_id, references(:users)
    end
  end
end
