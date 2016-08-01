class Repository < ApplicationRecord
  belongs_to :user

  validates :name, uniqueness: { scope: :user_id }

  def search_on_github(username, repo)
    begin
      Octokit.repo("#{username}/#{repo}")
    rescue
      nil
    end
  end
end
