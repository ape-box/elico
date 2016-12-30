defmodule Elico.PageController do
  use Elico.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
