# encoding: utf-8
class StudentsController < ApplicationController
  before_filter :authorize_not_student!
  def index
    @users = User.where("role = 1").order("email DESC").paginate(:page => params[:page], :per_page => 20)
  end
  # 查询页面
  def view
    
  end
  # 我的学生
  def my
    if current_user.role == 4
      @users = User.where(:role => 1, :jpm_id => current_user.id).order("email DESC").paginate(:page => params[:page], :per_page => 20)
    elsif current_user.role == 5
      @users = User.where(:role => 1, :spm_id => current_user.id).order("email DESC").paginate(:page => params[:page], :per_page => 20)
    else
      @users = User.where(:role => 1, :spm_id => current_user.id).order("email DESC").paginate(:page => params[:page], :per_page => 20)
      flash[:alert] = "对不起!您的身份没有学生"
    end
  end
end
