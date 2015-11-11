require 'test_helper'

class TagsWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:tags, site: FactoryGirl.create(:site))
  end
  
  test "display" do
    render_widget :tags
    #assert_select "h1"
  end
end
