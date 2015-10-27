class Sites::PagesController < Sites::ApplicationController
  before_action :set_page, only: [:show, :edit, :update, :destroy]

  has_widgets do |root|
    root << widget(:comments)
  end

  # GET /pages/1
  # GET /pages/1.json
  def show
    authorize @page
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_page
      @page = @site.pages.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def page_params
      params.require(:page).permit(:title, :content)
    end
end
