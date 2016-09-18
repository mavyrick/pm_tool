class TasksController < ApplicationController

  def create
    task_params = params.require(:task).permit([:title, :due_date])
    @task = Task.create task_params

    if @task.save
  # render :show
      flash[:notice] = "Task created successfully"
      redirect_to task_path(@task)
    else
      render :new
    end
  end

  def destroy
    @task = Task.find params[:id]
  @task.destroy
  flash[:notice] = "Task deleted successfully"
  redirect_to tasks_path
  end

  def edit
    @task = Task.find params[:id]
  end

  def index
    @tasks = Task.order(created_at: :desc).page(params[:page]).per(10)
  end

  def new
    @task = Task.new
  end

  def show
    @task = Task.find params[:id]
    @discussion = Discussion.new
    # @comment = Comment.new
  end

  def update
    @task = Task.find params[:id]
    @task.update params.require(:task).permit([:title, :description])
    flash[:notice] = "Task editted successfully"
    redirect_to task_path(@task)
  end

  def search
    @task = Task.new
  end

  def search_button
    task_params = params.require(:task).permit([:title, :description])
    @task = Task.search task_params

    if @task.save
  # render :show
      redirect_to task_path(@task)
    else
      render :new
    end

  end

end
