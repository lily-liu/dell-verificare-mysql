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
      render :show, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      render :show, status: :ok, location: @user
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

    if @user = User.find(params[:Username])
      if @user.Password != params[:password]
        @message = "password missmatch"
        render :error
      else
        @user.Password = Digest::SHA1.hexdigest(@user.Password)
        render :show, status: :ok, location: @user
      end
    else
      @message = "no username"
      render :error
    end

  end


  private
  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    user_data =[:name, :nrp, :rank].map { |key| params.fetch(key, {}) }
  end

  # match token from FUCKING PLAINTEXT PASSWORD STORED ON DB using sha1
end
