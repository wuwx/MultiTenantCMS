class Sites::Settings::PostsController < Sites::Settings::ApplicationController

  def create
    create! do |success, failure|
      success.html { redirect_to edit_site_settings_post_url(id: @post) }
    end
  end

  def update
    update! { edit_site_settings_post_url }
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :content)
    end

    def resource_url
      site_settings_post_url
    end

    def collection_url
      site_settings_posts_url
    end
end
