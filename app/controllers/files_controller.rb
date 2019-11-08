require 'google/apis/drive_v3'
require 'google/api_client/client_secrets.rb'

class FilesController < ApplicationController
    
    def index
        service = Google::Apis::DriveV3::DriveService.new
        # Use google keys to authorize
        service.authorization = google_secret.to_authorization
        # Request for a new aceess token just incase it expired
        service.authorization.refresh!
        # Get a list of calendars
        @comment_list = service.comment_list()
    end

    def picker
        render "picker", layout: false
    end

    def create
        service = Google::Apis::DriveV3::DriveService.new
        # Use google keys to authorize
        service.authorization = google_secret.to_authorization
        # Request for a new aceess token just incase it expired
        service.authorization.refresh!
        # Get a list of calendars

        comment_list = service.list_comments(params[:file_id], fields: 'comments')

        @list = comment_list.comments.map { |comment| "#{comment.content} - #{comment.quoted_file_content.value if comment.quoted_file_content }"}

        render "index"
    end

    private

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