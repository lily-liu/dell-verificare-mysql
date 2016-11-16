class ApplicationController < ActionController::API
  def to_envelope(status,message,data)
    render json: {status:status,message:message,data:data}
  end

  # match token from FUCKING PLAINTEXT PASSWORD STORED ON DB using sha1
  def auth_token
    @user = User.find(params[:Username])
    if Digest::SHA1.hexdigest(@user.Password) != params[:Password]
      @message = "wrong token"
      render :error, status: :unauthorized
    end
  end

end
