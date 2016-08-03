class RepoRunnerWorker
  include Sidekiq::Worker
  def perform
    Repository.find_each do |repo|
      IssuesImportWorker.perform_async(repo.id)

      IssuesUpdateWorker.perform_async(repo.id)
    end
  end
end
