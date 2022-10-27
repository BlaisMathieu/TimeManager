defmodule TimemanagerapiWeb.UserController.UserController do
  use TimemanagerapiWeb, :controller

  alias Timemanagerapi.Accounts
  alias Timemanagerapi.Accounts.User

  action_fallback TimemanagerapiWeb.FallbackController

  def userID(conn, %{"userID" => id}) do
    user = Accounts.get_user!(id)
    render(conn, "show.json", user: user)
  end

  def userID_put(conn, %{"userID" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = user} <- Accounts.update_user(user, user_params) do
      render(conn, "show.json", user: user)
    end
  end

  def userID_delete(conn, %{"userID" => id}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
