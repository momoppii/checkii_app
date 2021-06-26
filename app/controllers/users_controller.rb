class UsersController < ApplicationController
  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。'
      redirect_to @user
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    
    if @user.update(user_params)
      flash[:success] = '更新されました'
      redirect_to root_path
    else
      flash.now[:danger] = '更新に失敗しました'
      render :edit
    end
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confiramation, :birthday, :belong, :underlying_diseases)
  end
end
