module SimpleNavigation
  module Renderer
    # Renders an ItemContainer as a <ul> element and its containing items as
    # <li> elements.
    # It adds the 'selected' class to li element AND the link inside the li
    # element that is currently active.
    #
    # If the sub navigation should be included (based on the level and
    # expand_all options), it renders another <ul> containing the sub navigation
    # inside the active <li> element.
    #
    # By default, the renderer sets the item's key as dom_id for the rendered
    # <li> element unless the config option <tt>autogenerate_item_ids</tt> is
    # set to false.
    # The id can also be explicitely specified by setting the id in the
    # html-options of the 'item' method in the config/navigation.rb file.
    class BootstrapList < SimpleNavigation::Renderer::Base
      def render(item_container)
        if skip_if_empty? && item_container.empty?
          ''
        else
          tag = options[:ordered] ? :ol : :div
          content = list_content(item_container)
          content_tag(tag, content, item_container.dom_attributes)
        end
      end

      private

      def list_content(item_container)
        item_container.items.map { |item|
          li_options = item.html_options.except(:link)
          tag_for(item)
        }.join
      end
    end
  end
end