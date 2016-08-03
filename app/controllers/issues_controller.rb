class IssuesController < ApplicationController
  def index
    @issues = Issue.includes(:repository)
                   .opened
                   .ordered
                   .paginate(page: params[:page])
  end
end
