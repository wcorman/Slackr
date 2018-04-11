class Api::ApplicationController < ApplicationController
  skip_before_action :verify_authenticity_token
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    def is_user_signed?
    end
    helper_method :is_user_signed?

    def current_user
      token = request.headers["AUTHORIZATION"]
      # The decoded token will be array containing
      # the payload and the JWT header in that order.
      begin
      payload = JWT.decode(
        token,
        Rails.application.secrets.secret_key_base
      )&.first

      # To get a value from payload, make sure to use
      # strings to access the keys. The payload's hash's
      # keys are all strings and not symbols.
      @user ||= User.find_by(id: payload["id"])

      rescue JWT::DecodeError => error
        nil
      end
    end

    helper_method :current_user

    private

    def authenticate_user!
      head :unauthorized unless current_user.present?
    end

    def encode_token(payload = {}, exp = 24.hours.from_now)
      payload[:exp] = exp.to_i # important!!! otherwise token never expires!
      JWT.encode(
        payload,
        Rails.application.secrets.secret_key_base
      )
    end

    protected

    def record_invalid(error)
      record = error.record
      errors = record.errors.map do |field, message|
        {
          type: error.class.to_s,
          record_type: record.class.to_s,
          field: field,
          message: message
        }
      end

      render(
        json: {
          errors: errors
        },
        status: :unprocessable_entity # alias for status code 422
      )
    end

  end
