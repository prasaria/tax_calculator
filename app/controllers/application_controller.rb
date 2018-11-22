class ApplicationController < ActionController::API
  rescue_from ActionController::ParameterMissing, with: :bad_request
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordNotUnique, with: :render_record_not_unique
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid
  rescue_from Errors::ValidationError, with: :unprocessible_entity

  include Api::V1 
  include ActionController::Serialization

  private

  def not_found(exception)
    render json: {
      errors: { message: exception.message },
      server: Errors::RAILS_CODE
    },
    status: :not_found
  end

  def bad_request
    render json: {
      errors: { message: exception.message },
      server: Errors::RAILS_CODE
    },
    status: :bad_request
  end
  
  def render_record_not_unique(exception)
    render json: {
      errors: { message: exception.message },
      server: Errors::RAILS_CODE
    },
    status: :unprocessable_entity
  end

  def record_invalid(exception)
    render json: {
      errors: { message: exception.message },
      server: Errors::RAILS_CODE
    },
    status: :unprocessable_entity
  end

  def unprocessible_entity(exception)
    render json: {errors: exception.errors}, status: exception.status, code: exception.code
  end


end