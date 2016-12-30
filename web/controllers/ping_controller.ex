defmodule Elico.PingController do
  use Elico.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def ping(conn, %{"msg" => msg} = params) do
    render conn, "ping.html", msg: msg
  end
end
