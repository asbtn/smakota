# frozen_string_literal: true

module Components
  class StorysetAttribution < Components::Base
    def view_template
      small class: "text-mindaro-500" do
        plain "Illustration by "
        a(href: "https://storyset.com/", class: "underline") { "Storyset" }
      end
    end
  end
end
