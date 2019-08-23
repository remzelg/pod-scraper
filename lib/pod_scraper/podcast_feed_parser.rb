# Based off itunes scraper from https://github.com/feedjira/feedjira/blob/master/lib/feedjira/parser/itunes_rss.rb
# Podcast Feedjira https://github.com/scour/feedjira-podcast/tree/master/lib/feedjira
module PodScraper
  class PodcastFeedParser
    include SAXMachine
    # include Feedjira::FeedUtilities

    # Identifying Feed Characteristics
    element :rss, as: :version, value: :version
    element :copyright
    element :link, as: :url
    element :"itunes:explicit", as: :itunes_explicit
    element :"itunes:complete", as: :itunes_complete

    # Title
    element :title
    # Description
    element :description
    element :"itunes:summary", as: :itunes_summary
    element :"itunes:subtitle", as: :itunes_subtitle
    # Author
    element :managingEditor
    element :"itunes:author", as: :itunes_author
    # Image
    element :"itunes:image", value: :href, as: :itunes_image
    element :image, class: RSSImage

    # Potentially useful fields
    element :"itunes:keywords", as: :itunes_keywords
    element :"itunes:type", as: :itunes_type

    def self.able_to_parse?(xml)
      %r{xmlns:itunes\s?=\s?[\"\']http://www\.itunes\.com/dtds/podcast-1\.0\.dtd[\"\']}i =~ xml # rubocop:disable Metrics/LineLength
    end
  end
end

# MVP
# Title
# Description
# Author
# Title Image
