class BasePage

  LOGO = {css: 'a.logo'}
  NEW_POST_BUTTON = { css: 'a.upload-button' }.freeze
  UPLOAD_MODAL = { id: 'upload-modal' }.freeze
  INPUT_BOX = { css: '#global-files-button' }.freeze

  SEARCH_BUTTON = {css: 'div.icon-search' }.freeze
  SEARCH_BAR = { css: 'input.search' }.freeze
  SEARCH_SUBMIT_BUTTON = { css: 'div.icon-search' }.freeze

  # Return a single element from a given locator
  #
  # ==== Attributes
  # * +locator+ - What to find the element with
  #
  def find_element(locator)
    $driver.find_element locator
  end

  # Return an array of elements from a given locator
  #
  # ==== Attributes
  # * +locator+ - What to find the element with
  #
  def find_elements(locator)
    $driver.find_elements locator
  end

  # Send keystrokes to a Selenium Element
  #
  # ==== Attributes
  # * +locator+ - What to find the element with
  # * +text+ - Text to enter into the element
  #
  def send_keys(locator, text)
    element = find_element(locator)
    element.send_keys(text)
  end

  # Return a boolean as to whether or not an item was displayed on the page
  #
  # ==== Attributes
  # * +locator+ - What to find the element with
  #
  def displayed?(locator)
    e = $driver.find_element locator
    e.displayed?
  end

  # Click a single element on the page
  #
  # ==== Attributes
  # * +locator+ - What to find the element with
  #
  def click(locator)
    e = $driver.find_element locator
    puts "Locator is invisible: #{locator}" unless displayed? locator
    e.click
  end

  # Get the text from an element
  #
  def get_text(locator)
    find_element(locator).text
  end

  # Scrolls the element into view on the screen
  #
  # ==== Attributes
  # * +locator+ - What to find the element with
  #
  def scroll_into_view(locator)
    e = $driver.find_element locator
    e.location_once_scrolled_into_view
    e # Return the object instead of only the location, which is what the previous statement calls
  end

  # Return a the value of an attribute for the given locator
  #
  # ==== Attributes
  # * +locator+ - What to find the element with
  # * +attribute+ - Corresponding name to the value you'd like to receive from the element
  #
  def get_attribute(element, attribute)
    element.attribute("#{attribute}")
  end

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

end