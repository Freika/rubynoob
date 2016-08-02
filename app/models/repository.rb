class Repository < ApplicationRecord
  belongs_to :user
  has_many :issues

  validates :name, uniqueness: { scope: :user_id }

  def search_on_github(username, repo)
    Octokit.repo("#{username}/#{repo}") rescue nil
  end

  def get_issues
    issues = Octokit.issues("#{user.username}/#{name}")

    issues.select do |issue|
      labels = issue[:labels].map { |l| l[:name] }
      labels.include?('RubyNoob')
    end
  end
end
