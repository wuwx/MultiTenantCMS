class CommentsWidget < Apotomo::Widget

  def display
    @comments = options[:site].comments
    render
  end

end
