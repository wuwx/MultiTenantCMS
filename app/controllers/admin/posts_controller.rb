class Admin::PostsController < Admin::ApplicationController
  inherit_resources

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content)
    end
end
