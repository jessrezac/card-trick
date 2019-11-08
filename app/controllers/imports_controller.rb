class ImportsController < ApplicationController

    def new
        @import = Import.new
    end

    def create
        raise import_params.inspect
    end

    private

    def import_params
        params.require(:import).permit(:file_id)
    end

end
