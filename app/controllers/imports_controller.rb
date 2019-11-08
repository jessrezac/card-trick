require 'google/apis/drive_v3'
require 'google/api_client/client_secrets.rb'

class ImportsController < ApplicationController

    def new
        @import = Import.new
    end

    def create
        @import = Import.new(import_params)
        @import.authorize(google_secret)
        @import.request_comments

        @stack = Stack.new
        @import.comments.each do |comment|
            
        end

        @list = comment_list.comments.map { |comment| "#{comment.content} - #{comment.quoted_file_content.value if comment.quoted_file_content }"}

        render "stacks/new"

    end

    private

    def import_params
        params.require(:import).permit(:file_id)
    end

    def google_secret
        Google::APIClient::ClientSecrets.new(
            {
                "web" =>
                {
                    "access_token" => current_user.google_token,
                    "refresh_token" => current_user.google_refresh_token,
                    "client_id" => ENV['GOOGLE_CLIENT_ID'],
                    "client_secret" => ENV['GOOGLE_CLIENT_SECRET']
                }
            }
        )
    end

end