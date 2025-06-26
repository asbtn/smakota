# frozen_string_literal: true

module Views

  class Header < Views::Base

    def view_template
      h1 { "Header" }
      p { "Find me in app/views/header.rb" }
    end

  end

end
