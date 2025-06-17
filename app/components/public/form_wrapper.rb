# frozen_string_literal: true

module Components

  module Public

    class FormWrapper < Components::Base

      def initialize(title:, flash: nil)
        @title = title
        @flash = flash
      end

      def view_template
        div class: "w-full px-4 py-12 sm:px-6 sm:py-16 lg:w-1/2 lg:px-8 lg:py-24" do
          div class: "mx-auto md:w-2/3 w-full" do
            render Components::Typography::Title.new title
            render Components::Flash.new flash if flash.present?

            yield
          end
        end
      end

      private

      attr_reader :title, :flash

    end

  end

end
