class Repository < ApplicationRecord
  belongs_to :user

  validates :name, uniqueness: { scope: :user_id }

  def search_on_github(username, repo)
    user = Octokit.user(username)

    repos = user.rels[:repos].get.data

    repos.find {|s| s[:name] == repository_params[:name]}
  end
end
