defmodule TimemanagerapiWeb.WorkingtimeController do
  use TimemanagerapiWeb, :controller

  alias Timemanagerapi.WorkingTimes
  alias Timemanagerapi.WorkingTimes.Workingtime

  action_fallback TimemanagerapiWeb.FallbackController

  def show(conn, %{"id" => id}) do
    workingtime = WorkingTimes.get_workingtime!(id)
    render(conn, "show.json", workingtime: workingtime)
  end

  def update(conn, %{"id" => id, "workingtime" => workingtime_params}) do
    workingtime = WorkingTimes.get_workingtime!(id)

    with {:ok, %Workingtime{} = workingtime} <- WorkingTimes.update_workingtime(workingtime, workingtime_params) do
      render(conn, "show.json", workingtime: workingtime)
    end
  end

  def delete(conn, %{"id" => id}) do
    workingtime = WorkingTimes.get_workingtime!(id)

    with {:ok, %Workingtime{}} <- WorkingTimes.delete_workingtime(workingtime) do
      send_resp(conn, :no_content, "")
    end
  end
end
