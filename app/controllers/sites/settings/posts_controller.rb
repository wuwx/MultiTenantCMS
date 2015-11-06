class Sites::Settings::PostsController < Sites::Settings::ApplicationController

  def new
    new! {
      @site.custom_fields.each do |custom_field|
        @post.custom_values.build(custom_field: custom_field)
      end
    }
  end

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
      params.require(:post).permit(:title, :content, :custom_values_attributes => [:custom_field_id, :value])
    end

    def collection
      get_collection_ivar || set_collection_ivar(end_of_association_chain.reverse_order)
    end

    def resource_url
      site_settings_post_url
    end

    def collection_url
      site_settings_posts_url
    end
end
