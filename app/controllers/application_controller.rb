class ApplicationController < ActionController::API
  # def to_envelope(status,message,data)
  #   render json: {status:status,message:message,data:data}
  # end

  # match token from token table
  def auth_token
    token_match = Token.where("ID = ? AND Username = ?",params.fetch(:Token,nil),params.fetch(:Username,nil))
    if !token_match.present?
      @message = "wrong token"
      render :error, status: :unauthorized
    end
  end

end
