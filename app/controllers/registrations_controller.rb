class RegistrationsController < Devise::RegistrationsController
  protected
    def after_sign_up_path_for(resource)
      user_plans_update_plan_path(resource)
    end
end
