# frozen_string_literal: true

require 'slack-ruby-client'
require 'time'

module Lita
  module Handlers
    module Amesh
      module Uploaders
        class SlackUploader
          def initialize(token:)
            Slack.configure do |config|
              config.token = token
            end
            @client = Slack::Web::Client.new
          end

          def upload_image(image_path)
            filename = "#{Time.now.strftime("%Y%m%d%H%M")}.jpg"

            client.files_upload(
              channels: '#general',
              as_user: false,
              file: Faraday::UploadIO.new(image_path, 'image/jpeg'),
              title: 'アメッシュ',
              filename: filename
            )
          end

          private

          def client
            @client
          end
        end
      end
    end
  end
end
