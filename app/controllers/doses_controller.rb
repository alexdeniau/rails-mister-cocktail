class DosesController < ApplicationController

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktails = Cocktails.find(params[:cocktails_id])
    @dose.cocktails = @cocktails
    if @dose.save
      redirect_to cocktails_path(@cocktails)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def dose_params
    params.require(:dose).permit(:description)
  end

end
