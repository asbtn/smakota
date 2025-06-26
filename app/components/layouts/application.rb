# frozen_string_literal: true

module Components

  module Layouts

    class Application < Components::Base

      include Phlex::Rails::Layout
      include Phlex::Rails::Helpers::ContentFor
      include Phlex::Rails::Helpers::AssetPath

      def view_template(&block)
        html do
          head do
            title_tag

            meta_tags
            csrf_meta_tags
            csp_meta_tag

            plain yield :head

            assets_tags
          end

          body class: "bg-pattern-i-like-food" do
            main class: "mx-auto max-w-screen-xl flex h-screen flex-col bg-hippie-pink-200" do
              render Components::Header.new

              block.call if block_given?
            end
          end
        end
      end

      private

      def title_tag
        title { content_for(:title) || "Смакота" }
      end

      def meta_tags
        meta(name: "viewport", content: "width=device-width,initial-scale=1")
        meta(name: "apple-mobile-web-app-capable", content: "yes")
        meta(name: "mobile-web-app-capable", content: "yes")
      end

      def assets_tags
        favicon_link_tag asset_path("favicon.ico")
        stylesheet_link_tag :app, "data-turbo-track": "reload"
        javascript_importmap_tags
      end

    end

  end

end
