class Sites::Settings::PluginsController < Sites::Settings::ApplicationController
  private
    def collection
      @themes = []
    end
end
