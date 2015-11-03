class Sites::ApplicationController < ::ApplicationController
  before_action :set_site

  before_action do |controller|
    @theme = @site.theme ? 'default' : @site.theme
    controller.prepend_view_path "app/themes/#{@theme}/views"
  end

  private
    def set_site
      @site ||= Site.find(params[:site_id])
    end
end
