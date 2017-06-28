defmodule JsonApi.Todo do
  use JsonApi.Web, :model

  schema "todos" do
    field :name, :string
    field :done, :boolean, default: false

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :done])
    |> validate_required([:name, :done])
  end
end
