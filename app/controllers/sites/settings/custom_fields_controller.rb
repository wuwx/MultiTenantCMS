class Sites::Settings::CustomFieldsController < Sites::Settings::ApplicationController
  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def custom_field_params
      params.require(:custom_field).permit(:name)
    end

    def resource_url
      site_settings_custom_field_url
    end

    def collection_url
      site_settings_custom_fields_url
    end
end
