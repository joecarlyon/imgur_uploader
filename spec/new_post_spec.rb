require_relative '../spec_helper'

context 'Tempus Automation Interview' do

  describe 'Imgur Homepage' do

    before :each do
      load_imgur
    end

    it 'loads correctly' do
      landing = LandingPage.new
      expect(get_page_title).to eql('Imgur: The magic of the Internet')
      expect(landing.logo_displayed?).to be true
    end

    it 'can upload file' do
      file_to_upload = File.absolute_path('../lib/javascript.jpg')

      landing = LandingPage.new
      landing.click_new_post
      expect(landing.upload_modal_displayed?).to be true
      landing.upload_file(file_to_upload)

      expect(landing.post_title_displayed?).to be true
      expect(landing.uploaded_image_displayed?).to be true
      expect(get_page_url).to start_with('https://imgur.com/a/')
    end
  end
end