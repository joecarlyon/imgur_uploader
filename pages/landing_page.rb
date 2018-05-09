require_relative 'base_page'

# Every page object should inherit from BasePage in one way or another
class LandingPage < BasePage

  NEW_POST_BUTTON = { css: 'a.upload-button' }.freeze
  UPLOAD_MODAL = { id: 'upload-modal' }.freeze
  INPUT_BOX = { css: '#global-files-button' }.freeze

  POST_TITLE = { css: 'h1.post-title' }.freeze
  UPLOADED_IMAGE = { css: 'div.post-image' }.freeze

  # Determine whether or not the upload modal is displayed
  #
  def upload_modal_displayed?
    wait = Selenium::WebDriver::Wait.new(timeout: 15)
    wait.until { displayed? UPLOAD_MODAL }
  end

  # Clicks the New Post button
  #
  def click_new_post
    click NEW_POST_BUTTON
  end

  # Uploads a file to imgur
  #
  def upload_file(file_path)
    # YUCK we need to use JS to remove the class that is disabling sending keys
    $driver.execute_script("$('#{INPUT_BOX[:css]}').removeAttr('class')")
    send_keys(INPUT_BOX, file_path)
  end

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