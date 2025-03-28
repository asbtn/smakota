class Views::Sessions::Form < Components::Base
  include Phlex::Rails::Helpers::FormWith
  include Phlex::Rails::Helpers::Routes

  register_output_helper :inline_svg_tag

  def view_template
    form_with url: session_path, class: "mb-0 max-w-md space-y-4" do |form|
      render Components::Form::Input.new(form:, attribute: :email_address, field: :email, icon: true)
      render Components::Form::Input.new(form:, attribute: :password, icon: true)

      div class: "flex items-center justify-between" do
        p class: "text-sm text-gray-500" do
          t(".forgot_password_or_sign_up",
            forgot_password_link: new_password_path,
            sign_up_link: new_registration_path).html_safe
        end

        render Components::Form::Submit.new(form:, action: :login)
      end
    end
  end
end
