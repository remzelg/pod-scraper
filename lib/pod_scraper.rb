require 'httparty'
require 'feedjira'

require "pod_scraper/version"
require "pod_scraper/rss_image"
require "pod_scraper/podcast_feed_parser"

module PodScraper
  class Error < StandardError; end
  # Your code goes here...
  def self.call(url)
    xml = HTTParty.get(url).body
    podcast = Feedjira.parse(xml, parser: PodScraper::PodcastFeedParser)

    byebug
  end
end

# Dont forget the MVP
