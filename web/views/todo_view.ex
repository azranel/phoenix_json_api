defmodule JsonApi.TodoView do
  use JsonApi.Web, :view

  def render("index.json", %{todos: todos}) do
    %{data: render_many(todos, JsonApi.TodoView, "todo.json")}
  end

  def render("show.json", %{todo: todo}) do
    %{data: render_one(todo, JsonApi.TodoView, "todo.json")}
  end

  def render("todo.json", %{todo: todo}) do
    %{id: todo.id,
      name: todo.name,
      done: todo.done}
  end
end
