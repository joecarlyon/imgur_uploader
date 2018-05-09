require_relative '../spec_helper'

context 'Tempus Automation Interview' do

  describe 'Search Page' do

    before :each do
      load_imgur
    end

    let(:search_term) { 'demon kitty' }

    it 'can search for cool cat pictures' do
      landing = LandingPage.new
      landing.click_search_icon
      landing.type_search_text search_term
      landing.submit_search

      search = SearchPage.new
      # The internet is full of cats
      search.get_number_of_images > 1
      expect(search.get_search_term).to eq(search_term)
      expect(get_page_url).to eq("https://imgur.com/search?q=#{search_term.tr(' ', '+')}")
    end
  end
end