class UserController < ApplicationController
  def index
    user = User.find("Integra")
    user_res = {asd:user.Username}
    render json: user_res
  end
end
