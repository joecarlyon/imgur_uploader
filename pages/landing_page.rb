require_relative 'base_page'

# Every page object should inherit from BasePage in one way or another
class LandingPage < BasePage

  POST_TITLE = { css: 'h1.post-title' }.freeze
  UPLOADED_IMAGE = { css: 'div.post-image' }.freeze

  # Returns if the post title is displayed
  #
  def post_title_displayed?
    wait = Selenium::WebDriver::Wait.new(timeout: 15)
    wait.until { displayed? POST_TITLE }
  end

  # Returns if the new image is displayed
  #
  def uploaded_image_displayed?
    displayed? UPLOADED_IMAGE
  end

end