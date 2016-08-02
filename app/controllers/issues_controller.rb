class IssuesController < ApplicationController
  def index
    @issues = Issue.all.order(created_at: :desc).paginate(page: params[:page])
  end
end
