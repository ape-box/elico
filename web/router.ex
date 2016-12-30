defmodule Elico.Router do
  use Elico.Web, :router

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

  scope "/", Elico do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/ping", PingController, :index
    get "/ping/:msg", PingController, :ping
  end

  scope "/shell", Elico do
    pipe_through :browser

    get "/", ShellController, :index
  end

  # Other scopes may use custom stacks.
  # scope "/api", Elico do
  #   pipe_through :api
  # end
end
