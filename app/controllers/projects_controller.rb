class ProjectsController < ApplicationController

  def create
    project_params = params.require(:project).permit(:title, :description, :attachment)
    @project = Project.create project_params

    if @project.save
  # render :show
      flash[:notice] = "Project created successfully"
      redirect_to project_path(@project)
    else
      render :new
    end

  end

  def destroy
    @project = Project.find params[:id]
  @project.destroy
  flash[:notice] = "Project deleted successfully"
  redirect_to projects_path
  end

  def edit
    @project = Project.find params[:id]
  end

  def index
    @projects = Project.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @project = Project.new
  end

  def show
    @project = Project.find params[:id]
    @discussion = Discussion.new
    @favourite = @project.favourite_for(current_user)
    @membership = @project.membership_for(current_user)
    # @memberships = User.where()
    # @comment = Comment.new
  end

  def update
    @project = Project.find params[:id]
    @project.update params.require(:project).permit([:title, :description, :attachment])
    flash[:notice] = "Project editted successfully"
    redirect_to project_path(@project)
  end

  def search
    @project = Project.new
  end

  def search_button
    project_params = params.require(:project).permit([:title, :description])
    @project = Project.search project_params

    if @project.save
  # render :show
      redirect_to project_path(@project)
    else
      render :new
    end

  end




  def favourites
    @user = current_user
  end



  before_action :authenticate_user!, except: [:index, :show]

end
