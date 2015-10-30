class Sites::Settings::CommentsController < Sites::Settings::ApplicationController

  private
    def collection
      get_collection_ivar || set_collection_ivar(end_of_association_chain.reverse_order)
    end

    def resource_url
      site_settings_comment_url
    end

    def collection_url
      site_settings_comments_url
    end
end
