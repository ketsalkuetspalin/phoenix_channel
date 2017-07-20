defmodule GlApi.Web.PageController do
  use GlApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
