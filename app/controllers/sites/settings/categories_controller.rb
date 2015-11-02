class Sites::Settings::CategoriesController < Sites::Settings::ApplicationController

  layout 'sites/settings/application'

  def update
    update! { collection_url }
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def category_params
      params.require(:category).permit(:name)
    end

    def resource_url
      site_settings_category_url
    end

    def collection_url
      site_settings_categories_url
    end
end
