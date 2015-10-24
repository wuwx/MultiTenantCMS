class Admin::SitesController < Admin::ApplicationController
  inherit_resources

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def site_params
      params.require(:site).permit(:title)
    end
end
