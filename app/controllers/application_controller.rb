class ApplicationController < ActionController::API
	include DeviseTokenAuth::Concerns::SetUserByToken
	before_action :configure_permitted_parameters, if: :devise_controller?
	include DeviseTokenAuth::Concerns::SetUserByToken
	rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

	protected
	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
	end
	def record_not_found
		resource_name = controller_name.singularize
		render json: {
			status: "error",
			errors: ["#{resource_name} not found"]
			}, status: :not_found
	end
end
