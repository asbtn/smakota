class Components::Flash < Components::Base
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
    flash.keys.each do |key|
      debugger
      div role: "alert", class: "p-4 mb-5 border-1 #{DIV_CLASS[key]}" do
        p(class: "text-sm #{P_CLASS[key]}") { flash[key] }
      end
    end
  end

  private

  attr_reader :flash
end
