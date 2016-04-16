class PrescriptionsController < ApplicationController
  before_action :authenticate_user!

  def index
    @prescriptions = Prescription.all
  end

  def show
    @prescription = Prescription.find(params[:id])
  end

  def new
    @prescription = Prescription.new(params[:id])
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

  def edit
    @prescription = Prescription.find(params[:id])
  end

  def update
    @prescription = Prescription.find(params[:id])
    if @prescription.update(prescription_params)
      redirect_to user_root_path
    else
      render action: "edit"
    end
  end

  def destroy
  end

  private

  def prescription_params
    params.require(:prescription).permit(:drug, :quantity, :dose_count, :frequency, :start_date, :end_date, :physician_name)
  end
end
