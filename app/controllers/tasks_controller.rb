class TasksController < ApplicationController
  def index
    @tasks = Task.all # Fetch all tasks from the database
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  # Action to show the form to edit an existing task
  def edit
    @task = Task.find(params[:id])
  end

  # Action to update an existing task
  def update
    @task = Task.find(params[:id])

    if @task.update(task_params)
      redirect_to tasks_path, notice: 'Task was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to tasks_path, notice: 'Task was successfully deleted.'
  end

  private # to create a new task

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
