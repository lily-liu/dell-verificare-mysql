class IssuesController < ApplicationController
  before_action :set_issue, only: [:show, :update]
  before_action :auth_token


  # GET /issues
  # GET /issues.json
  def index
    @issues = Issue.all
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
  end

  # POST /issues
  # POST /issues.json
  def create
    issue_photo = params.fetch(:Photo, nil)
    if issue_photo != nil && params[:Remarks].present? && params[:StoreName].present? && params[:BrandName].present? && params[:ProgramName].present?
      @issue = Issue.new(issue_params)
      @issue.Pictures = 1
      @issue.Timestamp = Time.now.to_i
      @issue.CampaignStart = params.fetch(:CampaignStart, Time.now).to_time.to_formatted_s(:db)
      @issue.CampaignEnd = params.fetch(:CampaignEnd, Time.now + 1.week).to_time.to_formatted_s(:db)
      if @issue.save
        if upload_photo(issue_photo, @issue.ID.to_s + "_1")
          render :show, status: :created
        else
          @message = "issue unprocessable"
          render :error, status: :unprocessable_entity
        end
      else
        render json: @issue.errors, status: :unprocessable_entity
      end
    else
      @message = "missing photo or parameters"
      render :error, status: :bad_request
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    if @issue.update(issue_params)
      render :show, status: :ok, location: @issue
    else
      render json: @issue.errors, status: :unprocessable_entity
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy
    @issue.destroy
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_issue
    @issue = Issue.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def issue_params
    user_data = {
        Remarks: params.fetch(:Remarks, nil),
        StoreName: params.fetch(:StoreName, ""),
        BrandName: params.fetch(:BrandName, ""),
        ProgramName: params.fetch(:ProgramName, ""),
        Latitude: params.fetch(:Latitude, 0),
        Longitude: params.fetch(:Longitude, 0),
        Username: params.fetch(:Username, "")
    }
  end

  # save photo for uploading
  def upload_photo(proof_image, filename)
    uploader = PhotoUploader.new
    uploader.setname(filename)
    uploader.setstore("img/issue")
    uploader.store!(proof_image)
  end
end
