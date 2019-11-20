class StacksController < ApplicationController
    before_action :require_log_in
    before_action :set_stack, only: [:show, :edit, :update, :destroy]
    before_action :authorize_user_by_stack, only: [:show, :edit, :update, :destroy]


    def index
        @stacks = current_user.stacks.all
    end

    def new
        @stack = Stack.new
        5.times { @stack.cards.build }
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
        redirect_to stack_path(@stack)
    end

    def destroy
        @stack.delete
        redirect_to stacks_path
    end

    def all_stacks
        @stacks = Stack.by_card_count
        render "index"
    end

    private

    def stack_params
        params.require(:stack).permit(
            :title, 
            :thumbnail, 
            :file_id, 
            cards_attributes: [
                :id,
                :front_content,
                :back_content,
                :comment_id,
                :_destroy
                ]
            )
    end

    def set_stack
        @stack = Stack.find(params[:id])
    end

    def authorize_user_by_stack
        unless @stack.user == current_user
            redirect_to stacks_path
        end
    end
end
