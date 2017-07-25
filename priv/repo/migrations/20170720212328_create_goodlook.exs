defmodule GlApi.Repo.Migrations.CreateGoodlook do
  use Ecto.Migration

  def change do
    create table(:requests) do
      add :name, :string
      add :status, :string

      timestamps()
    end

  end
end

