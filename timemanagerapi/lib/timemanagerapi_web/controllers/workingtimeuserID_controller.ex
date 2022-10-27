defmodule TimemanagerapiWeb.WorkingtimeController.WorkingtimeController do
  use TimemanagerapiWeb, :controller

  alias Timemanagerapi.WorkingTimes
  alias Timemanagerapi.WorkingTimes.Workingtime

  action_fallback TimemanagerapiWeb.FallbackController

  def show(conn, %{"userID" => id}) do
    workingtime = WorkingTimes.get_workingtimes!(id)
    render(conn, "show.json", workingtime: workingtime)
  end

  def userID(conn, %{"userID" => id}) do
    # conn = Plug.Conn.fetch_query_params(conn)
    # params = conn.query_params
    # IO.inspect params["start"], label: "The list is"
    workingtimes = WorkingTimes.get_workingtimes!(id)

    render(conn, "index.json", workingtimes: workingtimes)
  end

  def userID_post(conn, %{"userID" => id, "workingtime" => workingtime_params}) do
    with {:ok, %Workingtime{} = workingtime} <- WorkingTimes.create_workingtime(workingtime_params, id) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.workingtime_path(conn, :show, workingtime))
      |> render("show.json", workingtime: workingtime)
    end
  end
end
