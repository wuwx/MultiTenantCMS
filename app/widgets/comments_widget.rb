class CommentsWidget < Apotomo::Widget

  def display(args)
    @comments = args[:commentable].comments
    render
  end

end
