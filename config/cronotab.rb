class RepoRunnerJob
  def perform
    RepoRunnerWorker.perform_async
  end
end

Crono.perform(RepoRunnerWorker).every 3.minute
