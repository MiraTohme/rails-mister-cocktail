class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @ingredient = Ingredient.find(dose_params[:ingredient_id])
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(description: dose_params[:description])
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to cocktails_path
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
