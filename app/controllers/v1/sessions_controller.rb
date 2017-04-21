module V1
	class SessionsController < DeviseTokenAuth::SessionsController
	  def render_create_success
	    render_json_confirmation I18n.t(:welcome, scope: [:generics, :confirms] , welcome_user: current_user.name) , :ok
	  end
	end
end