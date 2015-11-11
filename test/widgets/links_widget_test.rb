require 'test_helper'

class LinksWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:links)
  end
  
  test "display" do
    @site = FactoryGirl.create(:site)
    render_widget :links, :display, { :links => @site.links }
    #assert_select "h1"
  end
end
