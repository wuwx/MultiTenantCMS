class Sites::CommentsController < Sites::ApplicationController
  before_action :set_commentable
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  # POST /comments
  # POST /comments.json
  def create
    @comment = @commentable.comments.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to [@site, @commentable], notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: [@site, @commentable, @comment] }
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_commentable
      if params.keys.include?('post_id')
        @commentable = @site.posts.find(params[:post_id])
      end
      if params.keys.include?('page_id')
        @commentable = @site.pages.find(params[:page_id])
      end
    end

    def set_comment
      @comment = @post.comments.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:content)
    end

end
