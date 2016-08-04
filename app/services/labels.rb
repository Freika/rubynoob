class Labels
  def self.list(issue)
    issue[:labels].map{ |label| label[:name] }
  end
end
