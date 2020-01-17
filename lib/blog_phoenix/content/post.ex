defmodule BlogPhoenix.Content.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias BlogPhoenix.Accounts.User

  schema "posts" do
    field :body, :string
    field :title, :string

    belongs_to :user, BlogPhoenix.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:title, :body, :user_id])
    |> validate_required([:title, :body])
  end
end
