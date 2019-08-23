RSpec.describe PodScraper do
  describe '#call' do

    it "scrapes Dan Carlin's Hardcore History" do
      expect(described_class.call('https://www.dancarlin.com/dchh-feedburner.xml'))
        .to include(
          :title,
          :subtitle,
          :author,
          :description,
          :image_url
        )
    end
  end
end
