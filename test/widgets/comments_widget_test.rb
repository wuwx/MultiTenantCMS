require 'test_helper'

class CommentsWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:comments, site: FactoryGirl.create(:site))
  end
  
  test "display" do
    render_widget :comments
    #assert_select "h1"
  end
end
