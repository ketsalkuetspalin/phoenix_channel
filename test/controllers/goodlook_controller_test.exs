defmodule GlApi.GoodlookControllerTest do
  use GlApi.ConnCase

  alias GlApi.Goodlook
  @valid_attrs %{name: "some name", status: "some status"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, goodlook_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing requests"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, goodlook_path(conn, :new)
    assert html_response(conn, 200) =~ "New goodlook"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, goodlook_path(conn, :create), goodlook: @valid_attrs
    assert redirected_to(conn) == goodlook_path(conn, :index)
    assert Repo.get_by(Goodlook, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, goodlook_path(conn, :create), goodlook: @invalid_attrs
    assert html_response(conn, 200) =~ "New goodlook"
  end

  test "shows chosen resource", %{conn: conn} do
    goodlook = Repo.insert! %Goodlook{}
    conn = get conn, goodlook_path(conn, :show, goodlook)
    assert html_response(conn, 200) =~ "Show goodlook"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, goodlook_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    goodlook = Repo.insert! %Goodlook{}
    conn = get conn, goodlook_path(conn, :edit, goodlook)
    assert html_response(conn, 200) =~ "Edit goodlook"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    goodlook = Repo.insert! %Goodlook{}
    conn = put conn, goodlook_path(conn, :update, goodlook), goodlook: @valid_attrs
    assert redirected_to(conn) == goodlook_path(conn, :show, goodlook)
    assert Repo.get_by(Goodlook, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    goodlook = Repo.insert! %Goodlook{}
    conn = put conn, goodlook_path(conn, :update, goodlook), goodlook: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit goodlook"
  end

  test "deletes chosen resource", %{conn: conn} do
    goodlook = Repo.insert! %Goodlook{}
    conn = delete conn, goodlook_path(conn, :delete, goodlook)
    assert redirected_to(conn) == goodlook_path(conn, :index)
    refute Repo.get(Goodlook, goodlook.id)
  end
end
