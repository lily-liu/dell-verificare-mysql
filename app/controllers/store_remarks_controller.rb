class StoreRemarksController < ApplicationController
  before_action :set_store_remark, only: [:show, :update]
  before_action :auth_token

  # GET /store_remarks
  # GET /store_remarks.json
  def index
    @store_remarks = StoreRemark.all
  end

  # GET /store_remarks/1
  # GET /store_remarks/1.json
  def show
  end

  # POST /store_remarks
  # POST /store_remarks.json
  def create
    remark_photo = params.fetch(:Photo, nil)
    if params[:Photo] != nil
      @store_remark = StoreRemark.new(store_remark_params)
      @store_remark.Timestamp = Time.now.to_i
      if @store_remark.save
        if upload_photo(remark_photo,@store_remark.ID.to_s)
          render :show, status: :created
        else
          @message = "remark unprocessable"
          render :error, status: :unprocessable_entity
        end
      else
        render json: @store_remark.errors, status: :unprocessable_entity
      end
    else
      @message = "no photo for remark"
      render :error, status: :bad_request
    end
  end

  # PATCH/PUT /store_remarks/1
  # PATCH/PUT /store_remarks/1.json
  def update
    if @store_remark.update(store_remark_params)
      render :show, status: :ok, location: @store_remark
    else
      render json: @store_remark.errors, status: :unprocessable_entity
    end
  end

  # DELETE /store_remarks/1
  # DELETE /store_remarks/1.json
  def destroy
    @store_remark.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_store_remark
    @store_remark = StoreRemark.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def store_remark_params
    user_data = {
        Remarks: params.fetch(:Remarks, {}),
        StoreID: params.fetch(:StoreID, ""),
        Username: params.fetch(:Username, "")
    }
  end

  # save photo for uploading
  def upload_photo(proof_image, filename)
    uploader = PhotoUploader.new
    uploader.setname(filename)
    uploader.setstore("img/remark")
    uploader.store!(proof_image)
  end
end
