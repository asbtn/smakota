# frozen_string_literal: true

module Components

  class StorysetAttribution < Components::Base

    def view_template
      small class: "text-hippie-pink-500" do
        plain "Illustration by "
        a href: "https://storyset.com/",
          class: "underline",
          target: "_blank",
          rel: "noopener" do
          "Storyset"
        end
      end
    end

  end

end
