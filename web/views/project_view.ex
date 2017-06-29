defmodule JsonApi.ProjectView do
  use JsonApi.Web, :view
  use JaSerializer.PhoenixView

  attributes [:name, :inserted_at, :updated_at]
  

end
