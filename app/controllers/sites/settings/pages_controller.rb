class Sites::Settings::PagesController < Sites::Settings::ApplicationController

  def create
    create! { edit_site_settings_page_url(id: @page) }
  end

  def update
    update! { edit_site_settings_page_url }
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:parent_id, :slug, :title, :content)
    end

    def resource_url
      site_settings_page_url
    end

    def collection_url
      site_settings_pages_url
    end
end
