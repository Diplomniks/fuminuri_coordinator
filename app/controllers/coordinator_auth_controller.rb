# frozen_string_literal: true

class CoordinatorAuthController < ApplicationController
  def initialize
    @redis = Redis.new(host: "localhost")
  end

  def store_data
    rand = rand(1..100)
    permitted_params = params.permit(:email, :login, :password, :phone_number, :birthdate, :firstName, :lastName)

    data = {
      'email' => permitted_params[:email],
      'login' => permitted_params[:login],
      'password' => permitted_params[:password],
      'user_id' => ' '
    }

    key = "auth" + rand.to_s
    @redis.hmset(key, data)

    HTTParty.post('http://localhost:9292/api/v1/check_auth', body: { user: permitted_params, key: key , status: :ok})

  end
end
