class Sites::ApplicationController < ::ApplicationController
  helper_method :current_site

  private
    def current_site
      Site.first
    end
end
