class Sites::Settings::LinksController < Sites::Settings::ApplicationController

  layout 'sites/settings/application'

  def update
    update! { collection_url }
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def link_params
      params.require(:link).permit(:name)
    end

    def resource_url
      site_settings_link_url
    end

    def collection_url
      site_settings_links_url
    end
end
