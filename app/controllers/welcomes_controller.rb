class WelcomesController < ApplicationController
  # before_action :set_welcome, only: [:show, :update, :destroy]

  # GET /welcomes
  # GET /welcomes.json
  def index
    @welcomes = "Nyan!"
  end

  # # GET /welcomes/1
  # # GET /welcomes/1.json
  # def show
  # end
  #
  # # POST /welcomes
  # # POST /welcomes.json
  # def create
  #   @welcome = Welcome.new(welcome_params)
  #
  #   if @welcome.save
  #     render :show, status: :created, location: @welcome
  #   else
  #     render json: @welcome.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # PATCH/PUT /welcomes/1
  # # PATCH/PUT /welcomes/1.json
  # def update
  #   if @welcome.update(welcome_params)
  #     render :show, status: :ok, location: @welcome
  #   else
  #     render json: @welcome.errors, status: :unprocessable_entity
  #   end
  # end
  #
  # # DELETE /welcomes/1
  # # DELETE /welcomes/1.json
  # def destroy
  #   @welcome.destroy
  # end
  #
  # private
  #   # Use callbacks to share common setup or constraints between actions.
  #   def set_welcome
  #     @welcome = Welcome.find(params[:id])
  #   end
  #
  #   # Never trust parameters from the scary internet, only allow the white list through.
  #   def welcome_params
  #     params.fetch(:welcome, {})
  #   end
end
