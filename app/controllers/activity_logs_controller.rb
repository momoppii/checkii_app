class ActivityLogsController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :edit, :update]
  def index
    @q = current_user.activity_logs.ransack(params[:q])
    @activity_logs = @q.result.order(id: :desc).page(params[:page]).per(10)
  end
  
  def new
    @activity_log = ActivityLog.new
  end
  
  def create
    @activity_log = current_user.activity_logs.build(activity_log_params)
    
    if @activity_log.save
      redirect_to complete_activity_log_url(id: @activity_log)
    else
      flash.now[:danger] = '登録できませんでした'
      render 'new'
    end
  end
  
  def complete
    @activity_log = ActivityLog.find(params[:id])
  end

  def edit
    @activity_log = ActivityLog.find(params[:id])
  end

  def update
    @activity_log = ActivityLog.find(params[:id])
    if @activity_log.update(activity_log_params)
      flash[:success] = '更新されました'
      redirect_to activity_logs_url
    else
      flash.now[:danger] = '更新できませんでした'
      render :edit
    end
  end
  
  private
  
  def activity_log_params
    params.require(:activity_log).permit(:id, :log)
  end
end