require_relative 'imgur_base_page'

# Every page object should inherit from BasePage in one way or another
class SearchPage < ImgurBasePage

  FOUND_IMAGES = { css: 'div.cards > div' }.freeze
  SEARCH_TERM_USED = { css: 'span.search-term-text' }.freeze

  # Returns the number of images found
  #
  def get_number_of_images
    find_elements(FOUND_IMAGES).size
  end

  # Return the search string
  #
  def get_search_term
    get_text SEARCH_TERM_USED
  end

end