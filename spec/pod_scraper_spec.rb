RSpec.describe PodScraper do
  describe '#call' do

    it 'works' do
      described_class.call('https://www.dancarlin.com/dchh-feedburner.xml')
    end

  end
end
