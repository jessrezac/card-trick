class CardsController < ApplicationController

    before_action :set_card, only: [:show, :edit, :update, :destroy]
    before_action :authorize_user_by_stack, only: [:index, :show, :new, :create]
    before_action :authorize_user_by_card, only: [:edit, :update, :destroy]

    def index
        @cards = @stack.cards.all
    end

    def new
        @card = Card.new
    end

    def create
        @stack = Stack.find(card_params[:stack_id])
        @card = @stack.cards.create(card_params)
        redirect_to stack_card_path(@card.stack, @card)

        unless @stack.user == current_user
            redirect_to new_stack_path(@stack)
        end
    end

    def show
    end

    def edit
    end

    def update
        @card.update(card_params)
        redirect_to card_path(@card)
    end

    def destroy
        @stack = @card.stack
        @card.destroy
        redirect_to stack_cards_path(@stack)
    end

    private

    def card_params
        params.require(:card).permit(:front_content, :back_content, :mastery, :front_image, :back_image, :stack_id)
    end

    def set_card
        @card = Card.find(params[:id])
    end

    def authorize_user_by_stack
        @stack = Stack.find(params[:stack_id])
        unless @stack.user == current_user
            redirect_to stacks_path
        end
    end

    def authorize_user_by_card
        unless @card.stack.user == current_user
            redirect_to stacks_path
        end
    end
end
