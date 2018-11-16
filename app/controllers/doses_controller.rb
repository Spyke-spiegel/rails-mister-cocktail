class DosesController < ApplicationController
  before_action :set_cocktail

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktails_path(@cocktail)
    else
      render :new
    end

  end

  def update
    respond_to do |format|
      if @dose.update(dose_params)
        format.html { redirect_to @dose, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @dose }
      else
        format.html { render :edit }
        format.json { render json: @dose.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end
end
