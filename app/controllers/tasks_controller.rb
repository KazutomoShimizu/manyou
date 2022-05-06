class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.order(created_at: :desc)

    if params[:task].present?
      params_title = params[:task][:title]
      params_status = params[:task][:status]
      if (params_title && params_status).present?
        @tasks = @tasks.search_title(params_title).search_status(params_status)
      elsif params_title.present?
        @tasks = @tasks.search_title(params_title)
      elsif params_status.present?
        @tasks = @tasks.status_search(params_status)
      end

    elsif params[:sort_expired]
      @tasks = Task.all.order(end_date: :desc)
    elsif params[:sort_priority]
      @tasks = Task.all.order(priority: :asc)
    end
    @tasks = @tasks.page(params[:page]).per(5)
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
      :priority
    )
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
