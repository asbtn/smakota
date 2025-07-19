# frozen_string_literal: true

module Components

  class Header < Components::Base

    def view_template
      header do
        div class: "flex h-16 items-center" do
          render_nav

          div class: "ml-auto" do
            render_logout_button
          end
        end
      end
    end

    private

    def render_nav
      nav class: "flex items-center gap-6 text-sm" do
        render Headers::Link.new(name: t(".pantry"), path: pantry_path)
        render Headers::Link.new(name: t(".shopping_list"), disabled: true)
        render Headers::Link.new(name: t(".recipes"), disabled: true)
        render Headers::Link.new(name: t(".meal_planning"), disabled: true)
      end
    end

    def render_logout_button
      div class: "flex items-center" do
        render Headers::Button.new(name: t(".log_out"), path: session_path, method: :delete)
      end
    end

  end

end
