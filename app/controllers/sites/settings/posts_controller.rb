class Sites::Settings::PostsController < Sites::Settings::ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = @site.posts.all
  end

  # GET /posts/new
  def new
    @post = @site.posts.new
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = @site.posts.new(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to [@site, @post], notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: [@site, @post] }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
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
