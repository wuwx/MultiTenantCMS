class SitesController < ApplicationController

  theme "flat-ui", except: [:index]

  def show
    @site = Site.find(params[:id])
  end

  def index
    @sites = Site.all
  end

end
