module PodScraper
  class RSSImage
    include SAXMachine

    element :description
    element :height
    element :link
    element :title
    element :url
    element :width
  end
end
