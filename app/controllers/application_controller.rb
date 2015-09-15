class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception
  protected
  def process_request(obj, command, arg = nil)
    processed = arg ? obj.send(command, arg) : obj.send(command)

    if processed
      render json: processed
    else
      render json: processed.errors.full_messages, status: :unprocessable_entity
    end
  end
end
