# frozen_string_literal: true

module Components

  module Forms

    module Inputs

      class PasswordConfirmation < Input

        def initialize(form:)
          super(form:, attribute: :password_confirmation, as: :password, required: true, icon: true)
        end

      end

    end

  end

end
