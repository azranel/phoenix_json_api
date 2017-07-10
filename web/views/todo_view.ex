defmodule JsonApi.TodoView do
  use JsonApi.Web, :view
  use JaSerializer.PhoenixView

  attributes [:name, :done, :first_letter, :project_id]

  def first_letter(todo, _) do
    String.first(todo.name)
  end
end
