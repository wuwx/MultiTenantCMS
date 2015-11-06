class Sites::ApplicationController < ::ApplicationController
  before_action :set_site

  before_action do |controller|
    @site_theme = @site.theme ? @site.theme : 'default'
    controller.prepend_view_path "app/themes/#{@site_theme}/views"
  end

  has_widgets do |root|
    root << widget(:links)
  end

  private
    def set_site
      @site ||= Site.find(params[:site_id])
    end
end
