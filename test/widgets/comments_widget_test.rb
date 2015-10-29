require 'test_helper'

class CommentsWidgetTest < Apotomo::TestCase
  has_widgets do |root|
    root << widget(:comments)
  end
  
  test "display" do
    @post = FactoryGirl.create(:post)
    render_widget :comments, :display, { :commentable => @post }
    #assert_select "h1"
  end
end
