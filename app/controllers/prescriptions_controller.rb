class PrescriptionsController < ApplicationController

  def new
    @prescription = Prescription.new
  end

  def create
    @prescription = Prescription.new(prescription_params)
    @prescription.user_id = current_user.id

    if @prescription.save
      redirect_to root_path
    else
      render action: 'new'
    end
  end

  private

  def prescription_params
    params.require(:prescription).permit(:drug, :quantity, :dose_count, :frequency, :start_date, :end_date, :physician_name)
  end
end
