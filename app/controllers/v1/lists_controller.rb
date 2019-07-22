class V1::ListsController < ApplicationController
    def index
        @lists = List.all
        render json: { status: :Success!, message: 'Loaded Lists',data:@lists}
    end

    def show
        list = List.find_by(name: params[:name])
        items = Task.all
        render json: { status: :Success!, message: 'Loaded List' , data:list, tasks:items }
    end

    def create
        #res = ActiveSupport::JSON.decode(request.body.read)
        new_list = List.new(list_params)
        if new_list.save
            render json: { status: :Success!, message: "Created List" , data:new_list }
        else
            render json: { status: :Error, title: "Error in creating a list", message:new_list.errors }
        end
    end


    private

    def list_params
        params.require(:list).permit(:id,:name, :due_date, tasks_attributes:[:id,:title,:description,:priority])
    end

end