class Sites::Settings::ApplicationController < ::ApplicationController
  before_action :authenticate_user!
  theme Proc.new { |controller| Site.find(controller.params[:site_id]).theme || 'default' }

  inherit_resources
  belongs_to :site

  def resource_with_authorize
    authorize resource_without_authorize
    resource_without_authorize
  end
  def build_resource_with_authorize
    authorize build_resource_without_authorize
    resource_without_authorize
  end
  alias_method_chain :build_resource, :authorize
  alias_method_chain :resource, :authorize
  
end
