class AttemptsController < ApplicationController

    def create
        Attempt.create(attempt_params)
        @card = Card.find(attempt_params[:card_id])
        if @card.next
            redirect_to stack_card_path(@card.stack, @card.next)
        else
            redirect_to stack_path(@card.stack)
        end
    end

    private

    def attempt_params
        params.require(:attempt).permit(:success, :user_id, :card_id)
    end

end