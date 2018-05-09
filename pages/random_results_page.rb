require_relative 'imgur_base_page'

# Every page object should inherit from BasePage in one way or another
class RandomResultsPage < ImgurBasePage

  GALLERY_SORT_METHOD = { css: 'a > h3.sg-subtitle' }.freeze
  NEXT_GALLERY_BUTTON = { css: 'div.navNext' }.freeze

  # Gets the sort method of the gallery
  #
  def get_gallery_sort_method
    get_text GALLERY_SORT_METHOD
  end

  # Clicks through to the next gallery
  #
  def click_next_gallery
    click NEXT_GALLERY_BUTTON
  end

end