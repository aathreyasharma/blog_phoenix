defmodule BlogPhoenixWeb.Router do
  use BlogPhoenixWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BlogPhoenixWeb do
    pipe_through :browser

    # get "/", PageController, :index
    get "/", PostController, :index
    resources "/posts", PostController
    resources "/registrations", UserController, only: [:new, :create]
    
    get "/sign-in", SessionController, :new
    post "/sign-in", SessionController, :create
    delete "/sign-out", SessionController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", BlogPhoenixWeb do
  #   pipe_through :api
  # end
end
