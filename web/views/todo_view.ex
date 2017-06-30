defmodule JsonApi.TodoView do
  use JsonApi.Web, :view
  use JaSerializer.PhoenixView

  attributes [:name, :done, :first_letter]

  has_one :project,
    serializer: JsonApi.ProjectView,
    include: true

  def first_letter(todo, _) do
    String.first(todo.name)
  end
end
