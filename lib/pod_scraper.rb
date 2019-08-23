require 'httparty'
require 'feedjira'

require "pod_scraper/version"
require "pod_scraper/rss_image"
require "pod_scraper/parser"

module PodScraper
  class Error < StandardError; end
  # Your code goes here...
  def self.call(url)
    xml = HTTParty.get(url).body
    podcast_data = Feedjira.parse(xml, parser: PodScraper::Parser)
    podcast = podcast_to_json(podcast_data)

    podcast
  end

  # TODO: Possible future extensions
  # def self.fetch_recent_episodes(url, latest)
  # end

  # Private Class Methods
  def self.podcast_to_json(podcast_data)
    pd = podcast_data
    title = pd.title
    subtitle = pd.itunes_subtitle
    author = pd.itunes_author || pd.managingEditor
    description = pd.description || pd.itunes_summary
    image_url = pd.image.url || pd.itunes_image
    json = {
      title: title,
      subtitle: subtitle,
      author: author,
      description: description,
      image_url: image_url
    }

    json
  end

  private_class_method :podcast_to_json
end

# Dont forget the MVP
