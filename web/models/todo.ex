defmodule JsonApi.Todo do
  use JsonApi.Web, :model

  schema "todos" do
    field :name, :string
    field :done, :boolean, default: false

    belongs_to :project, JsonApi.Project

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :done, :project_id])
    |> validate_required([:name, :done, :project_id])
  end
end
