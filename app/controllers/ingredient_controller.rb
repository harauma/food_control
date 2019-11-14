class IngredientController < ApplicationController
  def new
    @category = Category.all
    @kitchen = Food.where(category_id: Category.where(category_name: 'キッチン').select(:id),food_delete_flg: 0)
    @drink = Food.where(category_id: Category.where(category_name: 'ドリンク').select(:id),food_delete_flg: 0)
    @ingredient = Food.new()
  end

  def create
    @ingredient = Food.new(ingredient_params)
    if @ingredient.save
      redirect_to('/ingredient/new')
    else
      puts @ingredient.errors.full_messages
      @error = お前のデータは登録できんかったよ！！！
      render('/ingredient/new')
    end
    # redirect_to('ingredient/new')
  end

  def destroy
    @food = Food.find_by(id: params[:id])
    @food.update(food_delete_flg:1)
    redirect_to('/ingredient/new')
  end

  def ingredient_params
    params.require(:food).permit(:food_name, :day, :category_id, :food_delete_flg)
  end
end
