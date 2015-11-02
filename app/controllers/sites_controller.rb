class SitesController < ApplicationController

  theme :default

  def show
    @site = Site.find(params[:id])
  end

  def index
    @sites = Site.all
    render layout: "application"
  end

end
