class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  respond_to :json

  	#**
  	# Error JSON messages rendering
  	#**
  	def render_json_unauthorized_error error_message
  		render_json_error error_message, :unauthorized
  	end

  	def render_json_conflict_error error_message
  		render_json_error error_message, :conflict
  	end

  	def render_json_not_found_error error_message
  		render_json_error error_message, :not_found
  	end

    def render_json_bad_request_error error_message
      render_json_error error_message, :bad_request
    end

    def render_json_unprocessable_entity_error error_message
      render_json_error error_message, :unprocessable_entity
    end

    def render_json_forbidden_error error_message
      render_json_error error_message, :forbidden
    end

  	#**
  	# Success JSON messages rendering
  	#**
  	def render_json_insert message
  		render_json_confirmation message, :created
  	end

  	def render_json_update_delete message
  		render_json_confirmation message, :ok
  	end

  	private

  		def render_json_error error_message, status_code
  			render json: { error_description: error_message }, status: status_code
  		end

  		def render_json_confirmation message, status_code
  			render json: { message: message }, status: status_code
  		end

end
