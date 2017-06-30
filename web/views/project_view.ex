defmodule JsonApi.ProjectView do
  use JsonApi.Web, :view
  use JaSerializer.PhoenixView

  attributes [:name, :inserted_at, :updated_at]

  has_many :todos,
    serializer: JsonApi.TodoView,
    include: true
end
