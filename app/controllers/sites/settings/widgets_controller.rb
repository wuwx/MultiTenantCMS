class Sites::Settings::WidgetsController < Sites::Settings::ApplicationController
  
  private
    def widget_params
      params.require(:widget).permit(:name, :title, :description)
    end
    
    def collection_url
      site_settings_widgets_url
    end
end
