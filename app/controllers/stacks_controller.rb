class StacksController < ApplicationController

    before_action :set_stack, only: [:show, :edit, :update, :destroy]

    def index
        @stacks = current_user.stacks.all
    end

    def new
        @stack = Stack.new
        render "new", layout: "newstack"
    end

    def create
        @stack = current_user.stacks.create(stack_params)
        redirect_to stacks_path
    end

    def show
    end

    def edit
    end

    def update
        @stack.update(stack_params)
        redirect_to stacks_path
    end

    def destroy
        @stack.delete
        redirect_to stacks_path
    end

    def import
        raise stack_params.inspect
    end

    private

    def stack_params
        params.require(:stack).permit(:title, :thumbnail, :file_id)
    end

    # def import_params
    #    params.require(:stack).permit(:file_id)    
    # end

    def set_stack
        @stack = Stack.find(params[:id])
    end
end
