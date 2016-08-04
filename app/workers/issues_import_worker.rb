class IssuesImportWorker
  include Sidekiq::Worker
  def perform(repo_id)
    repo = Repository.find(repo_id)

    issues = repo.get_issues
    issues.each do |issue|
      issue_info = {
        name: issue[:title],
        description: issue[:body],
        url: issue[:html_url],
        number: issue[:number]
      }

      IssuesCreatingWorker.perform_async(issue_info, repo_id)
    end
  end
end
