class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @prescriptions = Prescription.where(user: current_user)
    @physicians = Physician.where(user: current_user)
  end
end
