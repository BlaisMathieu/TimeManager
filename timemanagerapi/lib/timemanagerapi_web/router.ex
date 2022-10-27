defmodule TimemanagerapiWeb.Router do
  use TimemanagerapiWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {TimemanagerapiWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TimemanagerapiWeb do
    pipe_through :browser

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", TimemanagerapiWeb do
    resources("/users", UserController, only: [:index, :create, :show])
    scope "/users", UserController do
      get "/:userID", UserController, :userID
      put "/:userID", UserController, :userID_put
      delete "/:userID", UserController, :userID_delete
    end
    scope "/clocks", ClockController, only: [:show] do
      get "/:userID", ClockController, :userID
      post "/:userID", ClockController, :userID_post
    end
    resources "/workingtimes", WorkingtimeController, only: [:update, :delete] do
    end
    scope "/workingtimes", WorkingtimeController do
      get "/:userID", WorkingtimeController, :userID
      post "/:userID", WorkingtimeController, :userID_post
      scope "/:userID", WorkingtimeController do
        get "/:id", WorkingtimeController, :id
      end
    end
    pipe_through :api
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: TimemanagerapiWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
