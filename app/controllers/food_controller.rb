class FoodController < ApplicationController

  def index
    @current_date = Time.current
    # @foods = User.joins(:food_controls).includes(:food_controls)
    # @foods = FoodControl.all
    # @foods = FoodControl.joins(:users,:categories,:foods).select("food_controls.*,users.*,categories.*")
    @foods = FoodControl.joins(:user).joins(food: :category).where(delete_flg: 0).select("users.*,food_controls.*,foods.*,categories.*").order(end: "ASC")
    @kitchen = []
    @drink = []
    @foods.each do |food|
      if food.category_name == "キッチン"
        @kitchen << food
      else
        @drink << food
      end
    end
    # @drink = FoodControl.where(food_id: Food.where(category_id: Category.where(category_name: 'ドリンク').select(:id)).select(:id))
    # @kitchen = FoodControl.where(food_id: Food.where(category_id: Category.where(category_name: 'キッチン').select(:id)).select(:id))
  end

  def new
    @current_date = Time.current
    @users = User.where(user_delete_flg:0)
    @kitchen = Food.where(category_id: Category.where(category_name: 'キッチン').select(:id),food_delete_flg:0)
    @drink = Food.where(category_id: Category.where(category_name: 'ドリンク').select(:id),food_delete_flg:0)
  end

  def create
    @food_control = FoodControl.new(food_control_params)
    # binding.pry
    if @food_control.save
      redirect_to('/')
    else
      puts @ingredient.errors.full_messages
      @error = お前のデータは登録できんかったよ！！！
      render('/food/new')
    end
  end

  def delete
    @food_del = FoodControl.find_by(end: params[:end],food_id: params[:food_id])
    @food_del.delete_flg = 1
    @food_del.save
    # binding.pry
    redirect_to('/food/index')
  end

  def food_control_params
    params.require(:food_control).permit(:food_id,:start,:end,:user_id,:delete_flg)
  end
end
