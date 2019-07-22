class V1::TasksController < ApplicationController
    def create
        @list = List.find_by(name: params[:list_name])
        id = @list[:id]
        @task = Task.new(task_params)
        @task.list_id = id
        if @task.save!
            tasks = Task.where(list_id: id).all
            render json: { status: :Success!, message: "Created Tasks" , list:@list, tasks:tasks }
        else
            render json: { status: :Error, title: "Error in creating a list" }
        end
    end
    
    private

    def task_params
        params.require(:task).permit(:title,:description,:priority)
    end

end