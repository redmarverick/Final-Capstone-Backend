class Users::SessionsController < Devise::SessionsController
  respond_to :json
  skip_before_action :verify_authenticity_token

  def respond_with(resource, _opts = {})
    if resource.persisted?
      render json: { status: 200, user: resource, message: 'Logged in Successfully' }
    else
      render json: { message: 'Invalid email or password' }, status: :unprocessable_entity
    end # Add this 'end' statement
  end

  def destroy
    sign_out(current_user)
    render json: { message: 'Logged off successfully.' }
  end
end
