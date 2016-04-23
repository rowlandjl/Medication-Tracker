class PhysiciansController < ApplicationController

  def new
    @physician = Physician.new
  end

  def create
    @physician = Physician.new(physician_params)
    @physician.user_id = current_user.id

    if @physician.save
      redirect_to root_path
    else
      render action: 'new'
    end
  end

  private

  def physician_params
    params.require(:physician).permit(:name, :office, :address, :city, :state, :zip, :phone)
  end
end
