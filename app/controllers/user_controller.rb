class UserController < ApplicationController
  def index
    session[:userid] = nil
    @users = User.where(user_delete_flg:0)
    @count = @users.count
    @num = if @count % 3 == 2
             1
           elsif @count % 3 == 1
             2
           else
             0
           end
  end

  def choice
    session[:userid] = params[:id]
    redirect_to("/food/index")
  end

  def new

  end

  def create
    errors = nil
    @user = User.new(user_params)
    begin
      @user.save
    rescue => errors
    end
    if !errors && @user.errors.messages == {}
      session[:userid] = @user.id
    # binding.pry
      redirect_to('/food/index')
    else
      @error = "使用されているIDまたはパスワードが一致しません"
      @name = @user.user_name
      @id = @user.id
      @pass = @user.password
      render('/user/new')
    end
  end

  def mente
    @users = User.where(user_delete_flg:0)
    @count = @users.count
    @num = if @count % 3 == 2
             1
           elsif @count % 3 == 1
             2
           else
             0
           end
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.update(user_delete_flg:1)
    redirect_to('/user/mente')
  end

  def user_params
    params.require(:user).permit(:id, :user_name, :password, :password_confirmation, :user_delete_flg)
  end
end
