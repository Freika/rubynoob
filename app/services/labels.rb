class Labels
  class << self
    def list(issue)
      issue[:labels].map{ |label| label[:name] }
    end
  end
end
