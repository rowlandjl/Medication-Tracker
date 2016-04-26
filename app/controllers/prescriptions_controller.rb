class PrescriptionsController < ApplicationController
  before_action :authenticate_user!

  def show
    @prescription = Prescription.find(params[:id])
  end

  def new
    @prescription = Prescription.new
    @prescription_frequency = Prescription::FREQUENCY
    @prescription_dose = Prescription::DOSE
  end

  def create
    # HIT THE API
    # if no error code
      # make drug, prescription, etc
    # else
      # flash warning and re-render form

    # create drug from params[:drug][:name]
    # drug = Drug.new(drug_params)
    # @response = get_drug_data
    @prescription = Prescription.new(prescription_params)
    # @prescription.drug = drug
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

  def get_drug_data
    HTTParty.get(
      "https://api.fda.gov/drug/event.json?&api_key=L3H3SeWMU19yDPGy4N2pDhUmzbsF8JhnDAGTYH8b&search=patient.drug.openfda.generic_name:#{@prescription.drug}+brand_name:#{@prescription.drug}&count=patient.reaction.reactionmeddrapt.exact&limit=5"
    )
  end

  def drug_params
    params.require(:drug).permit(:name)
  end

  def prescription_params
    params.require(:prescription).permit(:drug, :strength, :quantity, :dose_count, :frequency, :start_date, :end_date, :physician_id)
  end
end
