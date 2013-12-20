module Calabash
  module Cucumber
    module StatusBarHelpers #=> Map

      def device_orientation(force_down=false)
        res = map(nil, :orientation, :device).first

        if ['face up', 'face down'].include?(res)
          if ENV['CALABASH_FULL_CONSOLE_OUTPUT'] == '1'
            if force_down
              puts "WARN  found orientation '#{res}' - will rotate to force orientation to 'down'"
            end
          end

          return res if !force_down
          return rotate_home_button_to :down
        end

        return res if !res.eql?('unknown')
        return res if !force_down
        rotate_home_button_to(:down)
      end

      def status_bar_orientation
        map(nil, :orientation, :status_bar).first
      end

    end
  end
end