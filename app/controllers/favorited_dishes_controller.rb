class FavoritedDishesController < ApplicationController
  before_action :set_favorited_dish, only: %i[show edit update destroy]

  def index
    @q = FavoritedDish.ransack(params[:q])
    @favorited_dishes = @q.result(distinct: true).includes(:bookmarks,
                                                           :users).page(params[:page]).per(10)
  end

  def show
    @bookmark = Bookmark.new
  end

  def new
    @favorited_dish = FavoritedDish.new
  end

  def edit; end

  def create
    @favorited_dish = FavoritedDish.new(favorited_dish_params)

    if @favorited_dish.save
      redirect_to @favorited_dish,
                  notice: "Favorited dish was successfully created."
    else
      render :new
    end
  end

  def update
    if @favorited_dish.update(favorited_dish_params)
      redirect_to @favorited_dish,
                  notice: "Favorited dish was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @favorited_dish.destroy
    redirect_to favorited_dishes_url,
                notice: "Favorited dish was successfully destroyed."
  end

  private

  def set_favorited_dish
    @favorited_dish = FavoritedDish.find(params[:id])
  end

  def favorited_dish_params
    params.require(:favorited_dish).permit(:name, :cuisine, :venues_id,
                                           :user_id)
  end
end
