defmodule Timemanagerapi.WorkingTimesTest do
  use Timemanagerapi.DataCase

  alias Timemanagerapi.WorkingTimes

  describe "workingtimes" do
    alias Timemanagerapi.WorkingTimes.Workingtime

    import Timemanagerapi.WorkingTimesFixtures

    @invalid_attrs %{}

    test "list_workingtimes/0 returns all workingtimes" do
      workingtime = workingtime_fixture()
      assert WorkingTimes.list_workingtimes() == [workingtime]
    end

    test "get_workingtime!/1 returns the workingtime with given id" do
      workingtime = workingtime_fixture()
      assert WorkingTimes.get_workingtime!(workingtime.id) == workingtime
    end

    test "create_workingtime/1 with valid data creates a workingtime" do
      valid_attrs = %{}

      assert {:ok, %Workingtime{} = workingtime} = WorkingTimes.create_workingtime(valid_attrs)
    end

    test "create_workingtime/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = WorkingTimes.create_workingtime(@invalid_attrs)
    end

    test "update_workingtime/2 with valid data updates the workingtime" do
      workingtime = workingtime_fixture()
      update_attrs = %{}

      assert {:ok, %Workingtime{} = workingtime} = WorkingTimes.update_workingtime(workingtime, update_attrs)
    end

    test "update_workingtime/2 with invalid data returns error changeset" do
      workingtime = workingtime_fixture()
      assert {:error, %Ecto.Changeset{}} = WorkingTimes.update_workingtime(workingtime, @invalid_attrs)
      assert workingtime == WorkingTimes.get_workingtime!(workingtime.id)
    end

    test "delete_workingtime/1 deletes the workingtime" do
      workingtime = workingtime_fixture()
      assert {:ok, %Workingtime{}} = WorkingTimes.delete_workingtime(workingtime)
      assert_raise Ecto.NoResultsError, fn -> WorkingTimes.get_workingtime!(workingtime.id) end
    end

    test "change_workingtime/1 returns a workingtime changeset" do
      workingtime = workingtime_fixture()
      assert %Ecto.Changeset{} = WorkingTimes.change_workingtime(workingtime)
    end
  end
end
