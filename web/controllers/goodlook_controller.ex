defmodule GlApi.GoodlookController do
  use GlApi.Web, :controller

  alias GlApi.Goodlook

  def index(conn, _params) do
    requests = Repo.all(Goodlook)
    render(conn, "index.html", requests: requests)
  end

  def new(conn, _params) do
    changeset = Goodlook.changeset(%Goodlook{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"goodlook" => goodlook_params}) do
    changeset = Goodlook.changeset(%Goodlook{}, goodlook_params)

    case Repo.insert(changeset) do
      {:ok, goodlook} ->
        conn
        |> put_flash(:info, "Goodlook created successfully.")
        |> redirect(to: goodlook_path(conn, :show, goodlook))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    goodlook = Repo.get!(Goodlook, id)
    render(conn, "show.html", goodlook: goodlook)
  end

  def edit(conn, %{"id" => id}) do
    goodlook = Repo.get!(Goodlook, id)
    changeset = Goodlook.changeset(goodlook)
    render(conn, "edit.html", goodlook: goodlook, changeset: changeset)
  end

  def update(conn, %{"id" => id, "goodlook" => goodlook_params}) do
    goodlook = Repo.get!(Goodlook, id)
    changeset = Goodlook.changeset(goodlook, goodlook_params)

    case Repo.update(changeset) do
      {:ok, goodlook} ->
        conn
        |> put_flash(:info, "Goodlook updated successfully.")
        |> redirect(to: goodlook_path(conn, :show, goodlook))
      {:error, changeset} ->
        render(conn, "edit.html", goodlook: goodlook, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    goodlook = Repo.get!(Goodlook, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(goodlook)

    conn
    |> put_flash(:info, "Goodlook deleted successfully.")
    |> redirect(to: goodlook_path(conn, :index))
  end
end
