defmodule Timemanagerapi.Repo.Migrations.CreateClocks do
  use Ecto.Migration

  def change do
    create table(:clocks) do
      add(:time, :utc_datetime)
      add(:status, :boolean)
      add :user_id, references(:users)
    end
  end
end
