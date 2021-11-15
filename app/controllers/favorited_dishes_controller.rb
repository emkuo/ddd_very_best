class FavoritedDishesController < ApplicationController
  before_action :set_favorited_dish, only: [:show, :edit, :update, :destroy]

  # GET /favorited_dishes
  def index
    @q = FavoritedDish.ransack(params[:q])
    @favorited_dishes = @q.result(:distinct => true).includes(:bookmarks, :users).page(params[:page]).per(10)
  end

  # GET /favorited_dishes/1
  def show
    @bookmark = Bookmark.new
  end

  # GET /favorited_dishes/new
  def new
    @favorited_dish = FavoritedDish.new
  end

  # GET /favorited_dishes/1/edit
  def edit
  end

  # POST /favorited_dishes
  def create
    @favorited_dish = FavoritedDish.new(favorited_dish_params)

    if @favorited_dish.save
      redirect_to @favorited_dish, notice: 'Favorited dish was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /favorited_dishes/1
  def update
    if @favorited_dish.update(favorited_dish_params)
      redirect_to @favorited_dish, notice: 'Favorited dish was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /favorited_dishes/1
  def destroy
    @favorited_dish.destroy
    redirect_to favorited_dishes_url, notice: 'Favorited dish was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_favorited_dish
      @favorited_dish = FavoritedDish.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def favorited_dish_params
      params.require(:favorited_dish).permit(:name, :cuisine, :venues_id, :user_id)
    end
end
