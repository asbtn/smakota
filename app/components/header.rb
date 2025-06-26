# frozen_string_literal: true

module Components

  class Header < Components::Base

    def view_template
      header class: "bg-hippie-pink-600 px-2 sm:px-2 lg:px-6" do
        div class: "flex h-16 items-center justify-between" do
          render Headers::Logo.new

          div class: "md:flex md:items-center md:gap-12" do
            render_nav
            render_user_section
          end
        end
      end
    end

    private

    def render_nav
      nav class: "hidden md:block" do
        ul class: "flex items-center gap-6 text-sm" do
          render Headers::Link.new(name: t(".pantry"), path: pantry_path)
          render Headers::Link.new(name: t(".shopping_list"))
          render Headers::Link.new(name: t(".recipes"))
          render Headers::Link.new(name: t(".meal_planning"))
        end
      end
    end

    def render_user_section
      div class: "flex items-center gap-4" do
        div class: "sm:flex sm:gap-4" do
          div class: "hidden sm:flex" do
            render Headers::Button.new(name: t(".log_out"))
          end
        end
      end
    end

  end

end
