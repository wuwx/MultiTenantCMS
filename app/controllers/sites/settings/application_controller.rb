class Sites::Settings::ApplicationController < ::ApplicationController
  before_action :set_site

  private
    def set_site
      @site ||= Site.find(params[:site_id])
      add_breadcrumb @site.title, site_path(@site)
      add_breadcrumb "控制面板", site_settings_path(@site)
    end
end
