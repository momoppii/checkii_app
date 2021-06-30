class ActivityLogsController < ApplicationController
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

  def index
    @activity_log = current_user.activity_logs.all.order(id: :desc).page(params[:page]).per(20)
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
