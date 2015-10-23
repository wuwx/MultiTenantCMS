class Sites::ApplicationController < ::ApplicationController
  before_action :set_site

  private
    def set_site
      @site ||= Site.find_by_name(params[:site_id])
    end
end
