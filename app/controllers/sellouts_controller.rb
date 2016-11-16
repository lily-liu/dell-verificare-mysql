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
    sellin_data = Sellin.find(sellout_params[:ServiceTag].to_s)
    store_data = Store.find(params[:StoreID].to_s)
    photo_proof = params.fetch(:Proof, nil)

    if sellin_data.present? && store_data.present?
      if photo_proof != nil
        @sellout = Sellout.new(sellout_params)
        proof = params.fetch(:Proof, {})
        sales_time = Time.now

        @sellout.DistributorID = sellin_data.DistributorID
        @sellout.StoreID = store_data.ID
        @sellout.MasterDealerID = ""
        store_data.ChannelManager.present? ? @sellout.ChannelManager = store_data.ChannelManager : @sellout.ChannelManager = ""
        store_data.TeamLeader.present? ? @sellout.TeamLeader = store_data.TeamLeader : @sellout.TeamLeader = ""
        store_data.Promoter.present? ? @sellout.Promoter = store_data.Promoter : @sellout.Promoter = ""
        @sellout.Salesman = ""
        @sellout.TransactionDate = sales_time.to_formatted_s(:db)
        @sellout.QuarterYear = current_quarter_year(sales_time)
        @sellout.Quarter = current_quarter_months(sales_time)
        @sellout.QuarterWeek = current_quarter_week(sales_time)
        @sellout.Year = sales_time.year
        @sellout.Month = sales_time.month
        @sellout.Day = sales_time.day
        @sellout.Other2 = ""
        @sellout.Other3 = ""
        @sellout.Other4 = ""
        @sellout.Other5 = ""
        if upload_photo(photo_proof,sellout_params[:ServiceTag])
          if @sellout.save
            render :show, status: :created
          else
            render json: @sellout.errors, status: :unprocessable_entity
          end
        else
          @message = "no photo for sellout"
          render :error, status: :bad_request
        end
      else
        @message = "error uploading photo for sellout"
        render :error, status: :unprocessable_entity
      end

    else
      @message = "no sellin for the service tag"
      render :error, status: :bad_request
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

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_sellout
    @sellout = Sellout.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def sellout_params
    user_data = {
        ServiceTag: params.fetch(:ServiceTag, {}),
        PriceIDR: params.fetch(:PriceIDR, 0),
        PriceUSD: params.fetch(:PriceUSD, 0),
        Other1: params.fetch(:Remark, "")
    }
  end

  def current_quarter_months(date)
    quarters = [[2, 3, 4], [5, 6, 7], [8, 9, 10], [11, 12, 1]]
    quarters.index(quarters[(date.month - 1) / 3])
  end

  def current_quarter_year(date)
    if date.month == 1
      year = date.year
    else
      year = date.year + 1
    end
  end

  # cant find any better solution to this weird problem
  # this function is to get week of current quarter
  # this function is part of legacy system
  def current_quarter_week(date)
    ((((date.to_i - 7171200)/86400) / 7).round % 13) + 1
  end

  def upload_photo(proof_image, filename)
    uploader = PhotoUploader.new
    uploader.setname(filename)
    uploader.store!(proof_image)
  end

end
