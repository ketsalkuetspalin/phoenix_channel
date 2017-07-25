defmodule GlApi.GoodlookTest do
  use GlApi.ModelCase

  alias GlApi.Goodlook

  @valid_attrs %{name: "some name", status: "some status"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Goodlook.changeset(%Goodlook{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Goodlook.changeset(%Goodlook{}, @invalid_attrs)
    refute changeset.valid?
  end
end
