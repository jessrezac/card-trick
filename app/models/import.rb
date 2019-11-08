require 'google/apis/drive_v3'
require 'google/api_client/client_secrets.rb'

class Import
    extend ActiveModel::Naming
    attr_accessor :file_id, :comments

    def initialize(attributes=nil)
        attributes.each {|key, value| self.send(("#{key}="), value)} if attributes
    end

    def authorize(google_secret)
        @service = Google::Apis::DriveV3::DriveService.new
        # Use google keys to authorize
        @service.authorization = google_secret.to_authorization
        # Request for a new aceess token just incase it expired
        @service.authorization.refresh!
    end

    def request_comments
        self.comments = @service.list_comments(self.file_id, fields: 'comments')
    end

end