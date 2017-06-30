defmodule JsonApi.ProjectController do
  use JsonApi.Web, :controller

  alias JsonApi.Project
  alias JaSerializer.Params

  plug :scrub_params, "data" when action in [:create, :update]

  def index(conn, _params) do
    projects = Repo.all(Project)
    render(conn, "index.json-api", data: projects)
  end

  def create(conn, %{"data" => data = %{"type" => "project", "attributes" => _project_params}}) do
    changeset = Project.changeset(%Project{}, Params.to_attributes(data))

    case Repo.insert(changeset) do
      {:ok, project} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", project_path(conn, :show, project))
        |> render("show.json-api", data: project, opts: [include: "todos"])
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(:errors, data: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    project = Repo.get!(Project, id)
    render(conn, "show.json-api", data: project)
  end

  def update(conn, %{"id" => id, "data" => data = %{"type" => "project", "attributes" => _project_params}}) do
    project = Repo.get!(Project, id)
    changeset = Project.changeset(project, Params.to_attributes(data))

    case Repo.update(changeset) do
      {:ok, project} ->
        render(conn, "show.json-api", data: project, opts: [include: "todos"])
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(:errors, data: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    project = Repo.get!(Project, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(project)

    send_resp(conn, :no_content, "")
  end

end
