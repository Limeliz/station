require_relative "../classes/html"

module Station
  module Unit
    class Antennevorarlberg < HTML
      config do
        id "antennevorarlberg"
        url "http://www.antennevorarlberg.at/api/onair.php"
      end

      def process
        track = data.at_css(".left > p").text.split("\n").map(&:strip)[-2]
        artist, song = track.split(/\s*:\s*/, 2)
        { artist: artist, song: song }
      end
    end
  end
end