class SitesController < ApplicationController
  theme Proc.new { |controller| Site.find(controller.params[:id]).theme || 'default' }, except: [:index]

  def show
    @site = Site.find(params[:id])
  end

  def index
    @sites = Site.all
  end

end
