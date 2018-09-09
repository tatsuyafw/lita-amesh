# frozen_string_literal: true

require 'time'
require 'mini_magick'

module Lita
  module Handlers
    module Amesh
      class Downloader
        BASE_URL = 'http://tokyo-ame.jwa.or.jp/'.freeze
        TIME_FORMAT = '%Y%m%d%H%M'

        def self.fetch_amesh_image
          new.fetch_amesh_image
        end

        def fetch_amesh_image
          result = MiniMagick::Image.open("#{BASE_URL}/map/map000.jpg")
          image = MiniMagick::Image.open("#{BASE_URL}/map/msk000.png")
          result = result.composite(image) do |c|
            c.compose 'Over'
          end

          rain_gif = fetch_rain_gif
          result = result.composite(rain_gif) do |c|
            c.compose 'Over'
          end

          result
        end

        private

        def fetch_rain_gif
          image = nil
          time = target_time
          begin
            image = MiniMagick::Image.open("#{BASE_URL}/#{rain_gif_path(time)}")
          rescue OpenURI::HTTPError => e
            Lita.logger.error(e.message)
            # Fetch 5 minutes ago image as a fallback image
            time = five_minutes_ago(time)
            image = MiniMagick::Image.open("#{BASE_URL}/#{rain_gif_path(time)}")
          end

          image
        end

        def rain_gif_path(time)
          t = time.strftime(TIME_FORMAT)
          "mesh/000/#{t}.gif"
        end

        def target_time
          current_time = Time.now
          current_time_str = current_time.strftime(TIME_FORMAT)
          current_time_i = current_time_str.to_i

          return current_time if (current_time_i % 5).zero?

          t = current_time_i - (current_time_i % 5)
          Time.parse(t.to_s)
        end

        def five_minutes_ago(time)
          time - 5 * 60
        end
      end
    end
  end
end
