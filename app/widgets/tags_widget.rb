class TagsWidget < Apotomo::Widget

  def display
    @tags = options[:site].tags
    render
  end

end
