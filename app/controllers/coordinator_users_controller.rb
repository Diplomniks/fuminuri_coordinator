# frozen_string_literal: true

class CoordinatorUsersController < ApplicationController
  def initialize
    @redis = Redis.new(host: "localhost")
  end

  def store_data
    puts 1
    binding.pry
    rand = rand(1..100)
    permitted_params = params.required(:user).permit(:email, :login, :password, :phone_number, :birthdate, :firstName, :lastName)

    data = {
      'email' => permitted_params[:email],
      'phone_number' => permitted_params[:phone_number],
      'birthday' => permitted_params[:birthdate],
      'firstName' => permitted_params[:firstName],
      'lastName' => permitted_params[:lastName]
    }

    key = "user" + rand.to_s
    @redis.hmset(key, data)

    #HTTParty.post('http://localhost:9292/check_auth', body: { user: permitted_params, key: key  })

  end
end
