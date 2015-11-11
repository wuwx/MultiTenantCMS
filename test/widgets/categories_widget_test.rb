require 'test_helper'

class CategoriesWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:categories, site: FactoryGirl.create(:site))
  end
  
  test "display" do
    render_widget :categories
    #assert_select "h1"
  end
end
