class Api::V1::FavoritedDishesController < Api::V1::GraphitiController
  def index
    favorited_dishes = FavoritedDishResource.all(params)
    respond_with(favorited_dishes)
  end

  def show
    favorited_dish = FavoritedDishResource.find(params)
    respond_with(favorited_dish)
  end

  def create
    favorited_dish = FavoritedDishResource.build(params)

    if favorited_dish.save
      render jsonapi: favorited_dish, status: :created
    else
      render jsonapi_errors: favorited_dish
    end
  end

  def update
    favorited_dish = FavoritedDishResource.find(params)

    if favorited_dish.update_attributes
      render jsonapi: favorited_dish
    else
      render jsonapi_errors: favorited_dish
    end
  end

  def destroy
    favorited_dish = FavoritedDishResource.find(params)

    if favorited_dish.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: favorited_dish
    end
  end
end
