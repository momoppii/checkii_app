class UsersController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :update]
  def show
    @user = current_user
  end

  def new
    @user = User.new
  end

  def create
     @user = User.new(user_params)

    if @user.save
      flash[:success] = 'ユーザを登録しました。ログインしてお使いください。'
      redirect_to root_path(@user.id)
    else
      flash.now[:danger] = '登録できませんでした'
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
      redirect_to root_path(@user.id)
    else
      flash.now[:danger] = '更新できませんでした'
      render :edit
    end
  end
  
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :birthday, :belong, :underlying_diseases, :vaccine)
  end
end
