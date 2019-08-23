# Based off itunes scraper from https://github.com/feedjira/feedjira/blob/master/lib/feedjira/parser/itunes_rss.rb
# Podcast Feedjira https://github.com/scour/feedjira-podcast/tree/master/lib/feedjira
module PodScraper
  class Parser
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
    element :"itunes:subtitle", as: :itunes_subtitle
    # Description
    element :description
    element :"itunes:summary", as: :itunes_summary
    # Author
    element :managingEditor
    element :"itunes:author", as: :itunes_author
    # Image
    element :"itunes:image", value: :href, as: :itunes_image
    element :image, class: RSSImage

    # Potentially useful fields
    element :"itunes:keywords", as: :itunes_keywords
    element :"itunes:type", as: :itunes_type
    element :pubDate
  end
end
