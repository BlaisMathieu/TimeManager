defmodule TimemanagerapiWeb.ClockController.ClockController do
  use TimemanagerapiWeb, :controller

  alias Timemanagerapi.Clocks
  alias Timemanagerapi.Clocks.Clock

  action_fallback TimemanagerapiWeb.FallbackController

  def userID(conn, %{"userID" => id}) do
    clocks = Clocks.get_clocks!(id)

    render(conn, "index.json", clocks: clocks)
  end

  def show(conn, %{"id" => id}) do
    clock = Clocks.get_clock!(id)
    render(conn, "show.json", clock: clock)
  end

  def userID_post(conn, %{"userID" => user_id, "clock" => clock_params}) do
    with {:ok, %Clock{} = clock} <- Clocks.create_clock(clock_params, user_id) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.clock_path(conn, :show, clock))
      |> render("show.json", clock: clock)
    end
  end

end
