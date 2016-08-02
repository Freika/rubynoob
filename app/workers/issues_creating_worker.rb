class IssuesCreatingWorker
  include Sidekiq::Worker
  def perform(issue, repo_id)
    repo = Repository.find(repo_id)

    repo.issues.create(issue)
  end
end
