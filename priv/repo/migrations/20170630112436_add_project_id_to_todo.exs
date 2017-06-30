defmodule JsonApi.Repo.Migrations.AddProjectIdToTodo do
  use Ecto.Migration

  def change do
    alter table(:todos) do
      add :project_id, references(:projects)
    end
  end
end
