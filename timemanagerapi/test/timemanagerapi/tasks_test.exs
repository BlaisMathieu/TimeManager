defmodule Timemanagerapi.TasksTest do
  use Timemanagerapi.DataCase

  alias Timemanagerapi.Tasks

  describe "tasks" do
    alias Timemanagerapi.Tasks.Taks

    import Timemanagerapi.TasksFixtures

    @invalid_attrs %{}

    test "list_tasks/0 returns all tasks" do
      taks = taks_fixture()
      assert Tasks.list_tasks() == [taks]
    end

    test "get_taks!/1 returns the taks with given id" do
      taks = taks_fixture()
      assert Tasks.get_taks!(taks.id) == taks
    end

    test "create_taks/1 with valid data creates a taks" do
      valid_attrs = %{}

      assert {:ok, %Taks{} = taks} = Tasks.create_taks(valid_attrs)
    end

    test "create_taks/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_taks(@invalid_attrs)
    end

    test "update_taks/2 with valid data updates the taks" do
      taks = taks_fixture()
      update_attrs = %{}

      assert {:ok, %Taks{} = taks} = Tasks.update_taks(taks, update_attrs)
    end

    test "update_taks/2 with invalid data returns error changeset" do
      taks = taks_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_taks(taks, @invalid_attrs)
      assert taks == Tasks.get_taks!(taks.id)
    end

    test "delete_taks/1 deletes the taks" do
      taks = taks_fixture()
      assert {:ok, %Taks{}} = Tasks.delete_taks(taks)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_taks!(taks.id) end
    end

    test "change_taks/1 returns a taks changeset" do
      taks = taks_fixture()
      assert %Ecto.Changeset{} = Tasks.change_taks(taks)
    end
  end

  describe "tasks" do
    alias Timemanagerapi.Tasks.Task

    import Timemanagerapi.TasksFixtures

    @invalid_attrs %{}

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Tasks.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Tasks.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      valid_attrs = %{}

      assert {:ok, %Task{} = task} = Tasks.create_task(valid_attrs)
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tasks.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      update_attrs = %{}

      assert {:ok, %Task{} = task} = Tasks.update_task(task, update_attrs)
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Tasks.update_task(task, @invalid_attrs)
      assert task == Tasks.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Tasks.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Tasks.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Tasks.change_task(task)
    end
  end
end
