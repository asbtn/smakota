class Views::Passwords::Edit < Views::Base
  include Phlex::Rails::Helpers::FormWith
  include Phlex::Rails::Helpers::ImageTag
  include Phlex::Rails::Helpers::Flash

  def initialize(token)
    @token = token
  end

  def view_template
    section class: "relative flex flex-wrap lg:h-screen lg:items-center" do
      render_left_half
      render_right_half
    end
  end

  private

  attr_reader :token

  def render_left_half
    div class: "w-full px-4 py-12 sm:px-6 sm:py-16 lg:w-1/2 lg:px-8 lg:py-24" do
      div class: "mx-auto md:w-2/3 w-full" do
        render Components::Typography::Title.new t(".title")

        render Components::Flash.new flash if flash.keys.present?

        render_form
      end
    end
  end


  def render_right_half
    div class: "relative h-64 w-full sm:h-96 lg:h-full lg:w-1/2 items-end" do
      image_tag "storyset/My password-bro.svg", class: "absolute inset-0 h-full w-full object-cover"
      render Components::StorysetAttribution.new
    end
  end

  def render_form
    form_with url: password_path(token), method: :put, class: "mb-0 max-w-md space-y-4 justify-center" do |form|
      render_form_inputs(form)
      render_form_footer(form)
    end
  end

  def render_form_inputs(form)
    render Components::Form::Input.new(form:, attribute: :password, required: true, icon: true)
    render Components::Form::Input.new(form:, attribute: :password_confirmation, field: :password, required: true, icon: true)
  end

  def render_form_footer(form)
    div class: "flex items-center justify-between" do
      p class: "text-sm text-gray-500" do
        a(href: new_session_path, class: "underline") { t ".login" }
      end

      render Components::Form::Submit.new(form:, action: :send)
    end
  end
end
