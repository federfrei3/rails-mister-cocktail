class CocktailsController < ApplicationController
  # before_action :find_cocktail, only: [:show]

  def index
    @cocktails = Cocktail.all
  end

  def show
    @cocktail = Cocktail.find(params[:id])
    # @doses = @cocktail.doses # see model -> a cocktail has many doses!
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to @cocktail, notice: 'Your cocktail was successfully created.'
    else
      render :new
    end
  end

  private

  # def find_cocktail
  #   @cocktail = Cocktail.find(params[:cocktail_id])
  # end

  def cocktail_params
    params.require(:cocktail).permit(:name, photos: [])
  end

end
