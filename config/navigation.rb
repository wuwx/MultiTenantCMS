SimpleNavigation::Configuration.run do |navigation|
  navigation.selected_class = 'active'
  navigation.autogenerate_item_ids = false
  
  navigation.items do |primary|
    primary.dom_class = 'list-group'
    primary.item :pages, '页面管理', site_settings_pages_path, html: {class: 'list-group-item'}
    primary.item :posts, '文章管理', site_settings_posts_path, html: {class: 'list-group-item'}
    primary.item :comments, '评论管理', site_settings_comments_path, html: {class: 'list-group-item'}
    primary.item :links,'链接管理', site_settings_links_path, html: {class: 'list-group-item'}
    primary.item :categories, '文章分类', site_settings_categories_path, html: {class: 'list-group-item'}
  end
end
