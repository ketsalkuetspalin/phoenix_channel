defmodule GlApi.Goodlook do
  use GlApi.Web, :model

  schema "requests" do
    field :name, :string
    field :status, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :status])
    |> validate_required([:name, :status])
  end
end
