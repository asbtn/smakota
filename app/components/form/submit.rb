# frozen_string_literal: true

module Components
  module Form
    class Submit < Components::Form::Base
      def initialize(**options)
        super
        @action = options[:action]
      end

      def view_template
        div class: "group relative inline-block focus:ring-3 focus:outline-hidden" do
          span class: "absolute inset-0 translate-x-1 translate-y-1 bg-mindaro-300 transition-transform " \
                      "group-hover:translate-x-0 group-hover:translate-y-0"
          form.submit t(".#{action}"),
                      class: "cursor-pointer relative inline-block border-1 border-current px-5 py-2 " \
                             "text-sm font-bold tracking-widest text-black uppercase"
        end
      end

      private

      attr_reader :action
    end
  end
end
