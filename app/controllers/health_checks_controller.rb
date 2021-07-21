class HealthChecksController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :edit, :update]
  def index
    @health_checks = current_user.health_checks.all.order(id: :desc).page(params[:page]).per(10)
  end
  
  def new
    @health_check = HealthCheck.new
  end
  
  def create
    @health_check = current_user.health_checks.build(health_check_params)
    
    if @health_check.save
      redirect_to complete_health_check_url(id: @health_check)
    else
      flash.now[:danger] = '登録できませんでした'
      render 'new'
    end
  end
  
  def complete
    @health_check = HealthCheck.find(params[:id])
    @templature = @health_check.templature
  end

  def edit
    @health_check = HealthCheck.find(params[:id])
  end
  
  def update
    @health_check = HealthCheck.find(params[:id])
    if @health_check.update(health_check_params)
      flash[:success] = '更新されました'
      redirect_to health_checks_url
    else
      flash.now[:danger] = '更新できませんでした'
      render :edit
    end
  end
  
  private
  
  def health_check_params
    params.require(:health_check).permit(:id, :templature, :memo, { respiratory_symptom: [], throat_nasus_eyes_symptom: [], digestive_symptom: [], other: [] })
  end
end