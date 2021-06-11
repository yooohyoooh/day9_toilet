import Config

config :search_toilets, SearchToilets.Repo,
  database: "search_toilets_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"
config :search_toilets, ecto_repos: [SearchToilets.Repo]
