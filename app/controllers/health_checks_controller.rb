class HealthChecksController < ApplicationController
  before_action :require_user_logged_in, only: [:index, :edit, :update]
  def index
    @health_checks = current_user.health_checks.all.order(id: :desc).page(params[:page]).per(10)
    @ten_health_checks = @health_checks.last(10)
    @respiratory_symptoms = ["せき", "息切れ", "胸部の痛みや圧迫感"]
    @throat_nasus_eyes_symptoms = ["のどの痛み", "鼻づまり", "結膜炎", "味やにおいを感じにくい"]
    @digestive_symptoms = ["吐き気や嘔吐", "腹痛", "下痢"]
    @others = ["倦怠感", "筋肉や関節の痛み", "頭痛", "発疹", "めまい", "悪寒", "食欲不振", "睡眠障害", "精神症状"]
  end
  
  def new
    @health_check = HealthCheck.new
    @respiratory_symptoms = ["せき", "息切れ", "胸部の痛みや圧迫感"]
    @throat_nasus_eyes_symptoms = ["のどの痛み", "鼻づまり", "結膜炎", "味やにおいを感じにくい"]
    @digestive_symptoms = ["吐き気や嘔吐", "腹痛", "下痢"]
    @others = ["倦怠感", "筋肉や関節の痛み", "頭痛", "発疹", "めまい", "悪寒", "食欲不振", "睡眠障害", "精神症状"]
  end
  
  def create
    @health_check = current_user.health_checks.build(health_check_params)
    @respiratory_symptoms = ["せき", "息切れ", "胸部の痛みや圧迫感"]
    @throat_nasus_eyes_symptoms = ["のどの痛み", "鼻づまり", "結膜炎", "味やにおいを感じにくい"]
    @digestive_symptoms = ["吐き気や嘔吐", "腹痛", "下痢"]
    @others = ["倦怠感", "筋肉や関節の痛み", "頭痛", "発疹", "めまい", "悪寒", "食欲不振", "睡眠障害", "精神症状"]
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
    @respiratory_symptoms = ["せき", "息切れ", "胸部の痛みや圧迫感"]
    @throat_nasus_eyes_symptoms = ["のどの痛み", "鼻づまり", "結膜炎", "味やにおいを感じにくい"]
    @digestive_symptoms = ["吐き気や嘔吐", "腹痛", "下痢"]
    @others = ["倦怠感", "筋肉や関節の痛み", "頭痛", "発疹", "めまい", "悪寒", "食欲不振", "睡眠障害", "精神症状"]
  end
  
  def update
    @health_check = HealthCheck.find(params[:id])
    @respiratory_symptoms = ["せき", "息切れ", "胸部の痛みや圧迫感"]
    @throat_nasus_eyes_symptoms = ["のどの痛み", "鼻づまり", "結膜炎", "味やにおいを感じにくい"]
    @digestive_symptoms = ["吐き気や嘔吐", "腹痛", "下痢"]
    @others = ["倦怠感", "筋肉や関節の痛み", "頭痛", "発疹", "めまい", "悪寒", "食欲不振", "睡眠障害", "精神症状"]
    @health_check.respiratory_symptom = params[:health_check][:respiratory_symptom]
    @health_check.throat_nasus_eyes_symptom = params[:health_check][:throat_nasus_eyes_symptom]
    @health_check.digestive_symptom = params[:health_check][:digestive_symptom]
    @health_check.other = params[:health_check][:other]
    if @health_check.update(health_check_params)
      flash[:success] = '更新されました'
      redirect_to health_checks_url
    else
      flash.now[:danger] = '更新できませんでした'
      render 'edit'
    end
  end
  
  private
  
  def health_check_params
    params.require(:health_check).permit(:id, :templature, { respiratory_symptom: [], throat_nasus_eyes_symptom: [], digestive_symptom: [], other: [] }, :memo)
  end
end