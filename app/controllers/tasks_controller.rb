class TasksController < ApplicationController
    # protect_from_forgery except: [:index, :show, :destroy, :create, :update]

    def index
        @task = Task.new
        @tasks = Task.all
        # render json: tasks
    end
    
    def show
        # task = Task.find(params[:id])
        # render json: task
    end

    def edit
        @task = Task.find(params[:id])
        @tasks = Task.all
        render :index
    end

    def destroy
        task = Task.find(params[:id])
        task.destroy
        redirect_to tasks_url
        # head :no_content
    end
    
    def create
        task = Task.new params[:task].permit(:title, :priority, :due)
        task.save
        redirect_to tasks_url
        # head :no_content
    end
    
    def update
        task = Task.find(params[:id])
        task.update(params[:task].permit(:title, :priority, :due))
        redirect_to tasks_url
        # head :no_content
    end
end
