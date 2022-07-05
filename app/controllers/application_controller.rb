class ApplicationController < ActionController::API
  include ActionController::Cookies

  # rescue_from ActiveRecord::RecordInvalid, with: :render_record_invalid
  # rescue_from ActiveRecord::RecordNotFound, with: :render_record_not_found
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_invalid

  # private

  # def render_record_invalid(invalid)
  #   render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
  # end

  # def render_record_not_found(error)
  #   render json: error, status: :not_found
  # end

  def render_not_found(exception)
    render json: {error: "#{exception.model} not found"}, status: :not_found
  end

  def render_invalid(exception)
      render json: {errors: exception.record.errors.full_messages}, status: :unprocessable_entity
    end

end
