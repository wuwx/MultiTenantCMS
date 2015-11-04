class Sites::Settings::ThemesController < Sites::Settings::ApplicationController
  private
    def collection
      @themes = ["default", "flat-ui", "material"]
    end
end
