require_relative '../spec_helper'

context 'Tempus Automation Interview' do

  describe 'Random Images' do

    before :each do
      load_imgur
    end

    it 'can be returned' do
      landing = LandingPage.new
      landing.click_random_button
      random = RandomResultsPage.new
      evaluate_random_expectations random

      random.click_next_gallery
      # This is now a new webpage, with a new URL
      random = RandomResultsPage.new
      evaluate_random_expectations random
    end

    def evaluate_random_expectations(random)
      expect(random.get_gallery_sort_method).to eql('sorted by random')
      expect(get_page_url).to start_with('https://imgur.com/gallery/')
    end
  end
end