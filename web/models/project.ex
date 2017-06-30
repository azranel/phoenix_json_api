defmodule JsonApi.Project do
  use JsonApi.Web, :model

  schema "projects" do
    field :name, :string

    has_many :todos, JsonApi.Todo
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
