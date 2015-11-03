module SimpleNavigation
  module Renderer
    class BootstrapBreadcrumbs < SimpleNavigation::Renderer::Base

      def render(item_container)
        content_tag(:ol, li_tags(item_container).join, { class: "breadcrumb" })
      end

      protected

      def li_tags(item_container)
        item_container.items.inject([]) do |list, item|
          if item.selected?
            if include_sub_navigation?(item)
              list << content_tag(:li, link_to(item.name, item.url, {method: item.method}.merge(item.html_options.except(:class,:id)))) if item.selected?
              list.concat li_tags(item.sub_navigation)
            else
              list << content_tag(:li, item.name, { class: 'active' }) if item.selected?
            end
          end
          list
        end
      end

    end
  end
end