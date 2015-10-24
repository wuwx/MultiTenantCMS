class Sites::ApplicationController < ::ApplicationController
  before_action :set_site

  private
    def set_site
      @site ||= Site.find(params[:site_id])
    end
end
