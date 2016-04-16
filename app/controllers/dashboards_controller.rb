class DashboardsController < ApplicationController
  before_action :authenticate_user!

  def show
    @prescription = Prescription.all
  end

end
