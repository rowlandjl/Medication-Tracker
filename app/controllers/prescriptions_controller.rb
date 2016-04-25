class PrescriptionsController < ApplicationController
  before_action :authenticate_user!

  def show
    @prescription = Prescription.find(params[:id])
    fda_url = ""
    reactions_search =
    reactions_limit
    adverse_reactions = HTTParty.get
  end

  def new
    @prescription = Prescription.new
    @prescription_frequency = Prescription::FREQUENCY
    @prescription_dose = Prescription::DOSE
  end

  def create
    @prescription = Prescription.new(prescription_params)
    @prescription.user_id = current_user.id

    if @prescription.save
      redirect_to root_path
    else
      @prescription_frequency = Prescription::FREQUENCY
      @prescription_dose = Prescription::DOSE
      render action: 'new'
    end
  end

  def edit
    @prescription = Prescription.find(params[:id])
    @prescription_frequency = Prescription::FREQUENCY
    @prescription_dose = Prescription::DOSE
  end

  def update
    @prescription = Prescription.find(params[:id])
    if @prescription.update(prescription_params)
      redirect_to user_root_path
    else
      @prescription_frequency = Prescription::FREQUENCY
      @prescription_dose = Prescription::DOSE
      render action: "edit"
    end
  end

  def destroy
    @prescription = Prescription.find(params[:id])
    @prescription.destroy
    redirect_to user_root_path
  end

  private

  def prescription_params
    params.require(:prescription).permit(:drug, :strength, :quantity, :dose_count, :frequency, :start_date, :end_date, :physician_id)
  end
end
