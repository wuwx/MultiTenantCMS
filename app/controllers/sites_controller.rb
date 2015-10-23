class SitesController < ApplicationController
  before_action :set_site, only: [:show, :edit, :update, :destroy]
  helper_method :current_site

  # GET /sites/1
  # GET /sites/1.json
  def show
    render layout: "sites/application"
  end

  # GET /sites
  # GET /sites.json
  def index
    @sites = Site.all
  end

  # GET /sites/new
  def new
    @site = Site.new
  end

  # POST /sites
  # POST /sites.json
  def create
    @site = current_user.sites.new(site_params)

    respond_to do |format|
      if @site.save
        format.html { redirect_to @site, notice: 'Site was successfully created.' }
        format.json { render :show, status: :created, location: @site }
      else
        format.html { render :new }
        format.json { render json: @site.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_site
    @site = Site.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def site_params
    params.require(:site).permit(:name, :title)
  end

  def current_site
    @site = Site.find(params[:id])
  end

end
