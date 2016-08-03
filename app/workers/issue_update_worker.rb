class IssuesUpdateWorker
  include Sidekiq::Worker
  def perform(repo_id)
    repo = Repository.find(repo_id)

    repo.issues.each { |issue| issue.update_from_github }
  end
end
