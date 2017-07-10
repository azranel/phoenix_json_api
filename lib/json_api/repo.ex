defmodule JsonApi.Repo do
  use Ecto.Repo, otp_app: :json_api
  use Scrivener, page_size: 10
end
