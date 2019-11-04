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
        @file_list = service.list_files
    end

    def picker
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