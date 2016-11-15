class SelloutsController < ApplicationController
  before_action :set_sellout, only: [:show, :update, :destroy]

  # GET /sellouts
  # GET /sellouts.json
  def index
    @sellouts = Sellout.all
  end

  # GET /sellouts/1
  # GET /sellouts/1.json
  def show
  end

  # POST /sellouts
  # POST /sellouts.json
  def create
    @sellout = Sellout.new(sellout_params)

    if @sellout.save
      render :show, status: :created, location: @sellout
    else
      render json: @sellout.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /sellouts/1
  # PATCH/PUT /sellouts/1.json
  def update
    if @sellout.update(sellout_params)
      render :show, status: :ok, location: @sellout
    else
      render json: @sellout.errors, status: :unprocessable_entity
    end
  end

  # DELETE /sellouts/1
  # DELETE /sellouts/1.json
  def destroy
    @sellout.destroy
  end

  def asd
    uploader = PhotoUploader.new
    uploader.setname(params[:st].to_s)
    uploader.store!(params[:proof])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sellout
      @sellout = Sellout.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sellout_params
      params.fetch(:sellout, {})
    end
end
