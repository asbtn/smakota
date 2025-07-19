# frozen_string_literal: true

module Components

  module Headers

    class Link < Components::Base

      include Phlex::Rails::Helpers::LinkTo

      def initialize(name:, path: "", disabled: false)
        @name = name
        @path = path
        @disabled = disabled
      end

      def view_template
        div class: "group relative inline-block focus:ring-3 focus:outline-hidden" do
          span class: "absolute inset-0 translate-x-1 translate-y-1 bg-hippie-pink-400 transition-transform " \
                      "#{'group-hover:translate-x-0 group-hover:translate-y-0' unless disabled}"
          link_to name, path, class: link_classes
        end
      end

      private

      attr_reader :name, :path, :disabled

      def link_classes
        default_classes = "cursor-pointer relative inline-block border-1 border-current px-5 py-2 " \
                          "text-sm font-bold tracking-widest text-gray uppercase"
        return default_classes unless disabled

        "#{default_classes} pointer-events-none opacity-50"
      end

    end

  end

end
