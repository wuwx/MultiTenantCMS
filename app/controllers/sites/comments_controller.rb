class Sites::CommentsController < Sites::ApplicationController
  before_action :set_post
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # POST /comments
  # POST /comments.json
  def create
    @comment = @post.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@site, @comment.post], notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: [@site, @post, @comment] }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = @site.posts.find(params[:post_id])
    end

    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content)
    end

end
