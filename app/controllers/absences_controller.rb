class AbsencesController < ApplicationController
  before_action :set_absence, only: [:show]
  before_action :auth_token

  # GET /absences
  # GET /absences.json
  def index
    @absences = Absence.all
  end

  # GET /absences/1
  # GET /absences/1.json
  def show
  end

  # POST /absences
  # POST /absences.json
  def create
    # render json: Absence.where("Timestamp > ? AND Absence = ? AND Username = ?",1.day.ago.to_i,"In",params[:Username])
    user = User.find(params[:Username])
    if user.present?
      case params[:Absence]
        when "Out"
          if Absence.where("Timestamp > ? AND Absence = ? AND Username = ?", 1.day.ago.to_i, "In", params[:Username].to_s).present?
            save_absence(user,absence_params)
          else
            @message = "cant absence out without absence in"
            render :error, status: :unauthorized
          end
        else
          save_absence(user,absence_params)
      end
    else
      @message = "no username match in database"
      render :error, status: :not_found
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_absence
    @absence = Absence.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def absence_params
    user_data = {
        Absence: params.fetch(:Absence, {}),
        Latitude: params.fetch(:Latitude, {}),
        Longitude: params.fetch(:Longitude, {}),
        Remarks: params.fetch(:Remarks, {}),
        StoreId: params.fetch(:StoreId, {})
    }
  end

  def save_absence(user,params)

    @absence = Absence.new(params)
    @absence.Username = user.Username
    @absence.Timestamp = Time.now.to_i

    if @absence.save
      render :show, status: :created
    else
      @message = "cant save, error on sending"
      render :error, status: :unprocessable_entity
    end

  end

end
