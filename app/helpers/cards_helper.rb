module CardsHelper

    def skip_card
        if @card.next
            link_to "Skip", stack_card_path(@card.stack, @card.next), class: "button is-large"
        else
            link_to "Finish", stack_path(@card.stack), class: "button is-large"
        end
    end
    
end
