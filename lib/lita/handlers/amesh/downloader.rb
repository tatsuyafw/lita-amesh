# frozen_string_literal: true

require 'time'
require 'mini_magick'

module Lita
  module Handlers
    module Amesh
      class Downloader
        BASE_URL = 'http://tokyo-ame.jwa.or.jp/'.freeze

        def self.fetch_amesh_image
          new.fetch_amesh_image
        end

        def fetch_amesh_image
          paths = [
            'map/map000.jpg',
            'map/msk000.png',
            rain_gif_path
          ]

          # TODO: Deal with an error when an amesh image is not found.
          begin
            result = MiniMagick::Image.open("#{BASE_URL}/#{paths[0]}")
          rescue => e
            Lita.logger.error(e.message)
          end

          paths[1..-1].each do |path|
            url = "#{BASE_URL}/#{path}"
            image = MiniMagick::Image.open(url)
            result = result.composite(image) do |c|
              c.compose 'Over'
            end
          end

          result
        end

        private

        def rain_gif_path
          current_time_str = Time.now.strftime("%Y%m%d%H%M")
          current_time_i = current_time_str.to_i

          if (current_time_i % 5).zero?
            return "mesh/000/#{current_time_str}.gif"
          end

          time = current_time_i - (current_time_i % 5)
          "mesh/000/#{time}.gif"
        end
      end
    end
  end
end
