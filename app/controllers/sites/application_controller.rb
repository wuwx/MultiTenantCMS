class Sites::ApplicationController < ::ApplicationController
  before_action :set_site
  theme Proc.new { |controller| Site.find(controller.params[:site_id]).theme || 'default' }

  private
    def set_site
      @site ||= Site.find(params[:site_id])
    end
end
