class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  rescue_from ActiveRecord::RecordNotUnique, with: :record_not_unique

private
  def record_not_unique
    render plain: "Sorry, But your Email is not unique. Please login with your previous service of register a new account.", status: 404
  end
end
