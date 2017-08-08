class TasksController < ApplicationController
    protect_from_forgery except: [:index, :show, :destroy, :create, :update]

    def index
        tasks = Task.all
        render json: tasks
    end
    
    def show
        task = Task.find(params[:id])
        render json: task
    end

    def destroy
        task = Task.find(params[:id])
        task.destroy
        head :no_content
    end
    
    def create
        task = Task.new params[:task].permit(:title, :priority)
        task.save
        head :no_content
    end
    
    def update
        task = Task.find(params[:id])
        task.update(params[:task].permit(:title, :priority))
        head :no_content
    end
end
