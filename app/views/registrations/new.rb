class Views::Registrations::New < Views::Base
  include Phlex::Rails::Helpers::ImageTag
  include Phlex::Rails::Helpers::FormWith
  include Phlex::Rails::Helpers::SimpleFormat

  def initialize(user:)
    @user = user
  end

  def view_template
    section(class: "relative flex flex-wrap lg:h-screen lg:items-center") do
      div(class: "w-full px-4 py-12 sm:px-6 sm:py-16 lg:w-1/2 lg:px-8 lg:py-24") do
        div(class: "mx-auto max-w-lg text-center") do
          h1(class: "text-mindaro-500 font-bold leading-none tracking-tight mx-auto w-full text-2xl lg:max-w-3xl lg:text-5xl italic") { simple_format t(".title") }
          p(class: "font-light leading-relaxed mx-auto lg:text-lg text-base max-w-3xl mt-5") { t(".description") }
        end

        div(class: "mx-auto max-w-md text-center mt-5") do
          form_with model: @user, url: registrations_path, class: "grid grid-cols-6 gap-6" do |form|
            div(class: "col-span-6") do
              render Components::Form::Input.new(form:, attribute: :name, field: :text)
            end
            div(class: "col-span-6") do
              render Components::Form::Input.new(form:, attribute: :email, icon: true)
            end
            div(class: "col-span-6 sm:col-span-3") do
              render Components::Form::Input.new(form:, attribute: :password, icon: true)
            end
            div(class: "col-span-6 sm:col-span-3") do
              render Components::Form::Input.new(form:, attribute: :password_confirmation, field: :password, icon: true)
            end

            div class: "col-span-6 flex justify-between items-center" do
              p class: "text-sm text-gray-500" do
                plain t(".has_account")
                whitespace
                a(href: new_session_path, class: "underline") { t(".log_in") }
              end

              render Components::Form::Submit.new(form:, action: :sign_up)
            end
          end
        end
      end

      div(class: "relative h-64 w-full sm:h-96 lg:h-full lg:w-1/2 items-end") do
        image_tag "storyset/Deconstructed food-bro.svg", class: "absolute inset-0 h-full w-full object-cover"
        render Components::StorysetAttribution.new
      end
    end
  end
end
