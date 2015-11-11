class LinksWidget < Apotomo::Widget

  def display(args)
    @links = args[:links]
    render
  end

end
