require_relative 'base_page'

# These are methods that are shared across the Imgur pages
#
class ImgurBasePage < BasePage
  LOGO = {css: 'a.logo'}
  NEW_POST_BUTTON = { css: 'a.upload-button' }.freeze
  UPLOAD_MODAL = { id: 'upload-modal' }.freeze
  INPUT_BOX = { css: '#global-files-button' }.freeze

  SEARCH_BUTTON = {css: 'div.icon-search' }.freeze
  SEARCH_BAR = { css: 'input.search' }.freeze
  SEARCH_SUBMIT_BUTTON = { css: 'div.icon-search' }.freeze

  RANDOM_BUTTON = { id: 'random-button' }.freeze

  def logo_displayed?
    displayed? LOGO
  end

  # Determine whether or not the upload modal is displayed
  #
  def upload_modal_displayed?
    wait = Selenium::WebDriver::Wait.new(timeout: 15)
    wait.until { displayed? UPLOAD_MODAL }
  end

  # Opens the search bar
  #
  def click_search_icon
    click SEARCH_BUTTON
  end

  # Type into the search bar
  #
  # @param [String] text - The text to search for
  #
  def type_search_text(text)
    send_keys SEARCH_BAR, text
  end

  # Clicks the button to start the search
  #
  def submit_search
    click SEARCH_SUBMIT_BUTTON
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
    send_keys INPUT_BOX, file_path
  end

  def click_random_button
    click RANDOM_BUTTON
  end
end