require 'test_helper'

class LinksWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:links)
  end
  
  test "display" do
    render_widget :links
    #assert_select "h1"
  end
end
