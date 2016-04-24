class PhysiciansController < ApplicationController

  def show
    @physician = Physician.find(params[:id])
  end

  def new
    @physician = Physician.new
    @user_physicians = Physician.where(user: current_user)
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

  def edit
    @physician = Physician.find(params[:id])
  end

  def update
    @physician = Physician.find(params[:id])
    if @physician.update(physician_params)
      redirect_to user_root_path
    else
      render action: "edit"
    end
  end

  def destroy
    @physician = Physician.find(params[:id])
    @physician.destroy
    redirect_to user_root_path
  end

  private

  def physician_params
    params.require(:physician).permit(:name, :office, :address, :city, :state, :zip, :phone)
  end
end
