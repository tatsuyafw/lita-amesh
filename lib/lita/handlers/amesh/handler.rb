# frozen_string_literal: true

require 'lita/handlers/amesh/downloader'
require 'lita/handlers/amesh/error'
require 'lita/handlers/amesh/uploaders/slack_uploader'

module Lita
  module Handlers
    module Amesh
      class Handler < Lita::Handler

        route(/^amesh\s*/, :amesh, command: true, help: {
                "amesh" => "Display a tokyo amesh image"
              })

        def amesh(response)
          uploader = nil

          case robot.config.robot.adapter
          when :slack
            token = robot.config.adapters.slack.token
            uploader = Uploaders::SlackUploader.new(token: token)
          else
            msg = "Not supported: #{robot.config.robot.adapter}"
            Lita.logger.error(msg)
            raise Error, msg
          end

          image = Downloader.fetch_amesh_image
          uploader.upload_image(image.path)
        end

        Lita.register_handler(self)
      end
    end
  end
end
