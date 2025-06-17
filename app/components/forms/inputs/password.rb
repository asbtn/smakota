# frozen_string_literal: true

module Components

  module Forms

    module Inputs

      class Password < Input

        def initialize(form:)
          super(form:, attribute: :password, as: :password, required: true, icon: true)
        end

      end

    end

  end

end
