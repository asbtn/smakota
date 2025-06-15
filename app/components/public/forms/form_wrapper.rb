# frozen_string_literal: true

module Components

  module Public

    module Forms

      class FormWrapper < Components::Base

        def initialize(title:, flash:)
          @title = title
          @flash = flash
        end

        def view_template
          div class: "mx-auto md:w-2/3 w-full" do
            render Components::Typography::Title.new title
            render Components::Flash.new flash

            yield
          end
        end

        private

        attr_reader :title, :flash

      end

    end

  end

end
