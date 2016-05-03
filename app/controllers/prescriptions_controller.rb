class PrescriptionsController < ApplicationController
  before_action :authenticate_user!

  def show
    @prescription = Prescription.find(params[:id])
  end

  def new
    @drug = Drug.new
    @prescription = Prescription.new
  end

  def create
    @prescription = Prescription.new(prescription_params)
    @drug = Drug.find_or_initialize_by(drug_params) # not checking uppderacse, etc

    @response = get_drug_data(params[:drug][:name])

    if @response["error"].present?
      flash[:alert] = "Please provide the name of a prescription drug."
      render action: 'new'
    else
      @prescription.drug = @drug
      @prescription.user_id = current_user.id

      if @drug.save && @prescription.save
        redirect_to root_path
      else
        render action: 'new'
      end
      save_api_adverse_reactions
    end
  end

  def edit
    @prescription = Prescription.find(params[:id])
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

  def get_drug_data(drug_name)
    HTTParty.get(
      "https://api.fda.gov/drug/event.json?&api_key=L3H3SeWMU19yDPGy4N2pDhUmzbsF8JhnDAGTYH8b&search=patient.drug.openfda.generic_name:#{drug_name}+brand_name:#{drug_name}&count=patient.reaction.reactionmeddrapt.exact&limit=10"
    )
  end

  def save_api_adverse_reactions
    reactions = []
    @response["results"].each do |result|
      reactions << result["term"]
    end
    @drug.update_attribute(:adverse_reactions, reactions)
  end

  def drug_params
    params.require(:drug).permit(:name, :adverse_reactions)
  end

  def prescription_params
    params.require(:prescription).permit(:strength, :quantity, :dose_count, :frequency, :start_date, :end_date, :physician_id)
  end
end
