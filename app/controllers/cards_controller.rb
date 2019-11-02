class CardsController < ApplicationController

    before_action :set_card, only: [:show, :edit, :update, :delete]

    def index
        @cards = current_user.cards.all
    end

    def new
        @card = Card.new
    end

    def create
        @card = current_user.cards.create(card_params)
        redirect_to card_path(@card)
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
        @card.delete
        redirect_to stacks_path
    end

    private

    def card_params
        params.require(:card).permit(:front_content, :back_content, :mastery)
    end

    def set_card
        @card = Card.find(params[:id])
    end
end
