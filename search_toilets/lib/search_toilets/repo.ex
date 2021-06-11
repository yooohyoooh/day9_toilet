defmodule SearchToilets.Repo do
  use Ecto.Repo,
    otp_app: :search_toilets,
    adapter: Ecto.Adapters.Postgres
end
