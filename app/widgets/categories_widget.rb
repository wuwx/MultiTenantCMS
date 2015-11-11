class CategoriesWidget < Apotomo::Widget
  
  def display
    @categories = options[:site].categories
    render
  end

end
