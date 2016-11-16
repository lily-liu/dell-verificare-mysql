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
    user = User.find(params.fetch(:Username), nil)
    existing_absence_in = Absence.where("Timestamp > ? AND Absence = ? AND Username = ? AND StoreID = ?", 12.hour.ago.to_i, "In", params[:Username].to_s, params.fetch(:StoreID))
    existing_absence_out = Absence.where("Timestamp > ? AND Absence = ? AND Username = ? AND StoreID = ?", 12.hour.ago.to_i, "Out", params[:Username].to_s, params.fetch(:StoreID))
    if user.present? && params[:StoreID].present? && params[:StoreID] != nil
      case params.fetch(:Absence, "In")
        when "Out"
          if existing_absence_in.present? && !existing_absence_out.present?
            save_absence(user, absence_params)
          else
            @message = "cant absence out without absence in or absence out multiple times"
            render :error, status: :unauthorized
          end
        when "In"
          if !existing_absence_in.present? && !existing_absence_out.present?
            save_absence(user, absence_params)
          else
            @message = "cant absence in same store multiple times"
            render :error, status: :unauthorized
          end
        else
          save_absence(user, absence_params)
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
        Absence: params.fetch(:Absence, "In"),
        Latitude: params.fetch(:Latitude, 0),
        Longitude: params.fetch(:Longitude, 0),
        Remarks: params.fetch(:Remarks, ""),
        StoreID: params.fetch(:StoreID, nil)
    }
  end

  def save_absence(user, params)

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
