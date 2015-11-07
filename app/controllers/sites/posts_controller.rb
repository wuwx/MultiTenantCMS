class Sites::PostsController < Sites::ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = @site.posts.order(id: :DESC)
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    authorize @post
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = @site.posts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content)
    end

end
