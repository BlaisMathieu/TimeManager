defmodule TimemanagerapiWeb.UserController do
  use TimemanagerapiWeb, :controller

  alias Timemanagerapi.Accounts
  alias Timemanagerapi.Accounts.User

  action_fallback TimemanagerapiWeb.FallbackController

  def index(conn, _params) do
    conn = Plug.Conn.fetch_query_params(conn)
    params = conn.query_params
    users = Accounts.findUser(params)
    render(conn, "index.json", users: users)
  end

  def email_check(email, user_params) do
    if String.match?(email, ~r/^[a-zA-Z0-9.%+-]+@[a-zA-Z0-9.-]+.[a-zA-Z]{2,4}$/) do
      user_params
    else
      nil
    end
  end

  def create(conn, %{"user" => user_params}) do
    # user_params = email_check(user_params["email"], user_params)
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
        conn
        |> put_status(:created)
        |> put_resp_header("location", Routes.user_path(conn, :show, user))
        |> render("show.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

end
