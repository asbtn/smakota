# frozen_string_literal: true

module Components

  module Forms

    module Inputs

      class Email < Input

        def initialize(form:)
          super(form:, attribute: :email_address, as: :email, required: true, icon: true)
        end

      end

    end

  end

end
