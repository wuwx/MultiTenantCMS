class Sites::Settings::CommentsController < Sites::Settings::ApplicationController
  inherit_resources
  belongs_to :site

  private
    def resource_url
      site_settings_comment_url
    end

    def collection_url
      site_settings_comments_url
    end
end
