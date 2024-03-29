class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :auth_token, except: [:login]

  # GET /users
  # GET /users.json
  def index
    @users = User.where("Level = ? OR Level = ? OR Level = ? OR Level = ? OR Level = ? OR Level = ? OR Level = ?", "Area Manager", "Channel Manager", "Merchandiser", "Observer", "Promoter", "Sales Representative", "Salesman")
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = set_user
    @user.Password = Digest::SHA1.hexdigest(@user.Password)
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      render :show, status: :created
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      render :show, status: :ok
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
  end

  def login
    @user = User.find(params.fetch(:Username, nil))
    if @user.present?
      if @user.Password != params.fetch(:Password, nil)
        @message = "password missmatch"
        render :error, status: :unauthorized
      else
        token = Token.new({ID: Digest::MD5.hexdigest(SecureRandom.uuid), Username: @user.Username, Timestamp: Time.now.to_i})
        if token.save
          @data = {Username: @user.Username, Level: @user.Level, Name: @user.Name, Token: token.ID}
          render :login, status: :ok
        end
        # @user.Password = Digest::SHA1.hexdigest(@user.Password)
      end
    else
      @message = "no username"
      render :error, status: :unauthorized
    end
  end

  def logout
    token_match = Token.where("ID = ? AND Username = ?",params.fetch(:Token,nil),params.fetch(:Username,nil)).first
    if token_match.present?
      token_match.destroy()
      render
    else
      @message = "you are not logged in"
      render :error, status: :unauthorized
    end
  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    user_data = {
        Username: params.fetch(:Username, {}),
        Password: params.fetch(:Password, {}),
        Level: params.fetch(:Level, {}),
        Position: params.fetch(:Position, {}),
        Name: params.fetch(:Name, {}),
        Gender: params.fetch(:Gender, {}),
        Birthplace: params.fetch(:Birthplace, {}),
        Birthday: params.fetch(:Birthday, {}),
        Email: params.fetch(:Email, {}),
        Phone: params.fetch(:Phone, {}),
        PINBB: params.fetch(:PINBB, {}),
        Address: params.fetch(:Address, {}),
        City: params.fetch(:City, {}),
        RTeamLeader: params.fetch(:RTeamLeader, {}),
        RDistributor: params.fetch(:RDistributor, {}),
        RCity: params.fetch(:RCity, {}),
        RFilter: params.fetch(:RFilter, {}),
        RShow: params.fetch(:RShow, {}),
        Rstart: params.fetch(:Rstart, {}),
        REnd: params.fetch(:REnd, {}),
        Timestamp: params.fetch(:Timestamp, {})
    }
  end

end
