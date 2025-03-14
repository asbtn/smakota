class Components::Sessions::Form < Components::Base
  include Phlex::Rails::Helpers::FormWith
  include Phlex::Rails::Helpers::Routes

  register_output_helper :inline_svg_tag

  def view_template
    form_with url: session_path, class: "mb-0 max-w-md space-y-4" do |form|
      render Components::Form::Input.new(form:, field: :email, icon: true)
      render Components::Form::Input.new(form:, field: :password, icon: true)

      div class: "flex items-center justify-between" do
        p class: "text-sm text-gray-500" do
          plain t(".no_account")
          whitespace
          a(href: new_user_path, class: "underline") { t(".sign_up") }
        end

        render Components::Form::Submit.new(form:, action: :login)
      end
    end
  end
end
