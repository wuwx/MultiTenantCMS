SimpleNavigation::Configuration.run do |navigation|
  navigation.items do |primary|
    primary.dom_class = 'nav navbar-nav'
    primary.selected_class = 'active'
    primary.item :sites, '站点列表', sites_path do |sites|
      sites.item :site, proc { @site.title }, proc { site_path(@site) }, if: proc { @site && @site.persisted? } do |site|
        site.dom_class = 'nav navbar-nav'
        site.selected_class = 'active'

        @site.pages.roots.each do |page|
          site.item page.id, page.title, site_page_path(@site, page)
        end
        site.item :posts, "站内文章", site_posts_path(@site), highlights_on: :subpath
 
        site.item :settings, '站点设置', site_settings_path(@site) do |settings|
          settings.dom_class = 'list-group'
          settings.selected_class = 'active'
          settings.item :posts, '文章管理', site_settings_posts_path(@site), link_html: {class: 'list-group-item'} do |posts|
            posts.dom_class = 'nav nav-tabs'
            posts.selected_class = 'active'
            posts.item :posts, '列表', site_settings_posts_path(@site) do |posts|
              posts.item :post, proc { @post.title }, proc { site_settings_post_path(@site, @post) }, if: proc { @post && @post.persisted? }, highlights_on: :subpath
            end
            posts.item :new_post, '撰写', new_site_settings_post_path(@site)
            posts.item :categories, '分类', site_settings_categories_path(@site), highlights_on: :subpath
            posts.item :tags, '标签', site_settings_tags_path(@site)
          end
          settings.item :pages, '页面管理', site_settings_pages_path(@site), link_html: {class: 'list-group-item'}, highlights_on: :subpath do |pages|
            pages.dom_class = 'nav nav-tabs'
            pages.selected_class = 'active'
            pages.item :index, '列表', site_settings_pages_path(@site)
            pages.item :new, '撰写', new_site_settings_page_path(@site)
          end
          settings.item :comments, '评论管理', site_settings_comments_path(@site), link_html: {class: 'list-group-item'}, highlights_on: :subpath
          settings.item :links, '链接管理', site_settings_links_path(@site), link_html: {class: 'list-group-item'}, highlights_on: :subpath
          settings.item :themes, '外观设置', site_settings_themes_path(@site), link_html: {class: 'list-group-item'}, highlights_on: :subpath do |themes|
            themes.dom_class = 'nav nav-tabs'
            themes.selected_class = 'active'
            themes.item :themes, '模板', site_settings_themes_path(@site)
            themes.item :widgets, '小组件', site_settings_widgets_path(@site)
          end
        end
      end
    end
    primary.item :admin, '站点后台', admin_path do |admin|
      admin.dom_class = 'nav navbar-nav'
      admin.selected_class = 'active'
      admin.item :posts, '文章', admin_posts_path, highlights_on: :subpath
      admin.item :comments, '评论', admin_comments_path, highlights_on: :subpath
      admin.item :links, '链接', admin_links_path, highlights_on: :subpath
      admin.item :sites, '站点', admin_sites_path, highlights_on: :subpath
      admin.item :users, '用户', admin_users_path, highlights_on: :subpath
    end
  end
end
