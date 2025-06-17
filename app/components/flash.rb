# frozen_string_literal: true

module Components

  class Flash < Components::Base

    DIV_CLASS = {
      alert: "bg-rose-50 border-rose-300",
      notice: "bg-sky-50 border-sky-300"
    }.with_indifferent_access

    P_CLASS = {
      alert: "text-rose-700",
      notice: "text-sky-700"
    }.with_indifferent_access

    def initialize(flash)
      @flash = flash
    end

    def view_template
      flash.each do |key, message|
        div role: "alert", class: div_class(key) do
          p(class: p_class(key)) { message }
        end
      end
    end

    private

    attr_reader :flash

    def div_class(key) = "p-4 mb-5 border-1 #{DIV_CLASS[key] || 'bg-gray-50 border-gray-300'}"
    def p_class(key) = "text-sm #{P_CLASS[key] || 'text-gray-700'}"

  end

end
