class StacksController < ApplicationController

    before_action :set_stack, only: [:show, :edit, :update, :destroy]

    def index
        @stacks = current_user.stacks.all
    end

    def new
        @stack = Stack.new
    end

    def create
        @stack = Stack.create(stack_params)
        redirect_to stack_path(@stack)
    end

    def show
    end

    def edit
    end

    def update
        @stack.update(stack_params)
        redirect_to stack_path(@stack)
    end

    def destroy
        @stack.delete
        redirect_to stacks_path
    end

    private

    def stack_params
        params.require(:stack).permit(:title, :image)
    end

    def set_stack
        @stack = Stack.find(params[:id])
    end
end
