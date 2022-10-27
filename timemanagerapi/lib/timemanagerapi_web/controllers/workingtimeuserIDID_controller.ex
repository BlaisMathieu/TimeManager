defmodule TimemanagerapiWeb.WorkingtimeController.WorkingtimeController.WorkingtimeController do
  use TimemanagerapiWeb, :controller

  alias Timemanagerapi.WorkingTimes
  alias Timemanagerapi.WorkingTimes.Workingtime

  action_fallback TimemanagerapiWeb.FallbackController

  def id(conn, %{"id" => id, "userID" => userID}) do
    workingtimes = WorkingTimes.get_userworkingtime!(id, userID)
    render(conn, "index.json", workingtimes: workingtimes)
  end
end
