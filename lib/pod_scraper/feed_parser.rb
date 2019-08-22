require 'httparty'
require 'feedjira'

module PodScraper
  class FeedParser

    def self.parse(url)
      xml = HTTParty.get(url).body
      content = Feedjira.parse(xml, parser: Feedjira::Parser::ITunesRSS)

      content
    end

    def self.parse_test
      json = parse('https://www.dancarlin.com/dchh-feedburner.xml')
      byebug
    end
  end
end
