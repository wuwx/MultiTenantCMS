class LinksWidget < Apotomo::Widget

  def display
    @links = options[:site].links
    render
  end
  
end
