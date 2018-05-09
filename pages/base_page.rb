# This contains all of the methods that aren't specific to any domain, but are nice
# to have when working with Selenium
#
class BasePage

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

end