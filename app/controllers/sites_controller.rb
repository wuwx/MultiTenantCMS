class SitesController < ApplicationController

  def show
    @site = Site.find(params[:id])
    render layout: "sites/application"
  end

  def index
    @sites = Site.all
  end

end
