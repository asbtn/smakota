class Components::Sessions::Form < Components::Base
  include Phlex::Rails::Helpers::EmailField
  include Phlex::Rails::Helpers::FormWith
  include Phlex::Rails::Helpers::Label
  include Phlex::Rails::Helpers::LinkTo
  include Phlex::Rails::Helpers::PasswordField
  include Phlex::Rails::Helpers::Routes

  register_output_helper :inline_svg_tag

  def view_template
    form_with url: session_path, class: "mb-0 max-w-md space-y-4" do |f|
      div do
        f.label :email, class: "sr-only"
        div class: "w-full relative inline-block focus:ring-3 focus:outline-hidden" do
          span class: "absolute inset-0 translate-x-1 translate-y-1 bg-mindaro-100 transition-transform group-hover:translate-x-0 group-hover:translate-y-0"
          plain f.email_field :email, class: "w-full relative inline-block border-1 border-black p-4 pe-12 text-sm shadow-sm shadow-mindaro-300",
                              placeholder: t(".email")
          span class: "absolute inset-y-0 end-0 grid place-content-center px-4" do
            inline_svg_tag "icons/email.svg"
          end
        end
      end

      div do
        f.label :password, class: "sr-only"
        div class: "w-full relative inline-block focus:ring-3 focus:outline-hidden" do
          span class: "absolute inset-0 translate-x-1 translate-y-1 bg-mindaro-100 transition-transform group-hover:translate-x-0 group-hover:translate-y-0"
          f.password_field :password, class: "w-full relative inline-block border-1 border-black p-4 pe-12 text-sm shadow-sm shadow-mindaro-300",
                                 placeholder: t(".password")
          span class: "absolute inset-y-0 end-0 grid place-content-center px-4" do
            inline_svg_tag "icons/eye.svg"
          end
        end
      end

      div class: "flex items-center justify-between" do
        p class: "text-sm text-gray-500" do
          plain t(".no_account")
          whitespace
          link_to t(".sign_up"), new_user_path, class: "underline"
        end
        link_to new_user_path, class: "group relative inline-block focus:ring-3 focus:outline-hidden" do
          span class: "absolute inset-0 translate-x-1 translate-y-1 bg-mindaro-300 transition-transform group-hover:translate-x-0 group-hover:translate-y-0"
          f.submit t(".log_in"), class: "relative inline-block border-1 border-current px-5 py-2 text-sm font-bold tracking-widest text-black uppercase"
        end
      end
    end
  end
end
