module ApplicationHelper

    def navbar_buttons
        if logged_in?
            render "layouts/logged_in_buttons"
        else
            render "layouts/logged_out_buttons"
        end
    end

end
