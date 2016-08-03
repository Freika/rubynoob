class RepositoriesController < ApplicationController
  before_action :set_repository, only: [:show, :edit, :update, :destroy]

  def index
    @repositories = Repository.ordered.paginate(page: params[:page])
  end

  def show
  end

  def new
    @repository = Repository.new
  end

  def edit
  end

  def create
    @repository = current_user.repositories.build(repository_params)

    repo = @repository.search_on_github(
             current_user.username, repository_params[:name]
           )

    if repo
      @repository = current_user.repositories.build(
                      name: repo[:name],
                      description: repo[:description],
                      url: repo[:html_url]
                    )
      @repository.save!

      redirect_to @repository, notice: 'Repository was successfully created.'
    else
      redirect_to :back, alert: 'Repo not found!'
    end
  end

  def update
    respond_to do |format|
      if @repository.update(repository_params)
        format.html { redirect_to @repository, notice: 'Repository was successfully updated.' }
        format.json { render :show, status: :ok, location: @repository }
      else
        format.html { render :edit }
        format.json { render json: @repository.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @repository.destroy
    respond_to do |format|
      format.html { redirect_to repositories_url, notice: 'Repository was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_repository
    @repository = Repository.find(params[:id])
  end

  def repository_params
    params.require(:repository).permit(:name, :description, :url)
  end
end
