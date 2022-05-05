class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.order(create_at: :desc)

    if params[:task].present?
      title = params[:task][:title]
      status = params[:task][:status]
      if (title && status).present?
        @tasks = @tasks.search_title(title).search_status(status)
      elsif title.present?
        @tasls = @tasks.search_title(title)
      elsif status.present?
        @tasks = @tasks.status_search(status)
      end

    elsif params[:sort_expired]
      @tasks = Task.all.order(end_date: :desc)
    elsif params[:sort_priority]
      @tasks = Task.all.order(priority: :asc)
    end
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to tasks_path, notice: "タスクを作成しました"
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to tasks_path, notice: "タスクを編集しました"
    else
      render :edit
    end
  end

  def destroy
    @task.destroy
    redirect_to tasks_path, notice:"タスクを削除しました"
  end

  def confirm
    @task = Task.new(task_params)
    render :new if @task.invalid?
  end

  private

  def task_params
    params.require(:task).permit(
      :title,
      :content,
      :end_date,
      :status,
    )
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
