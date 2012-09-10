# encoding: utf-8
class StudentsController < ApplicationController
  before_filter :authorize_not_student!
  before_filter :authorize_activity!
  def index
    # 所有激活的学生
    @users = User.where(:role => 1, :is_activity => true).order("email DESC").paginate(:page => params[:page], :per_page => 20)
    # 所有激活的督导
    @active_jpms = User.where(:role => 4, :is_activity => true).order("email DESC")
    # 所有激活的客户经理
    @active_spms = User.where(:role => 5, :is_activity => true).order("email DESC")
  end
  # 查询页面
  def view
    
  end
  # 学生的信息页
  def show
    @student = User.find(params[:id])
  end
  # 督导的
  def jpms
    # 所有激活的学生
    @users = User.where(:role => 1, :jpm_id => params[:id], :is_activity => true).order("email DESC").paginate(:page => params[:page], :per_page => 20)
    @jpm = User.find(params[:id])
  end
  # 客户经理的
  def spms
    # 所有激活的学生
    @users = User.where(:role => 1, :spm_id => params[:id], :is_activity => true).order("email DESC").paginate(:page => params[:page], :per_page => 20)
    @spm = User.find(params[:id])
  end
  # 我的学生
  def my
    if current_user.role == 4
      @users = User.where(:role => 1, :jpm_id => current_user.id, :is_activity => true).order("email DESC").paginate(:page => params[:page], :per_page => 20)
    elsif current_user.role == 5
      @users = User.where(:role => 1, :spm_id => current_user.id, :is_activity => true).order("email DESC").paginate(:page => params[:page], :per_page => 20)
    else
      @users = User.where(:role => 1, :spm_id => current_user.id, :is_activity => true).order("email DESC").paginate(:page => params[:page], :per_page => 20)
      flash[:alert] = "对不起!您的身份没有学生"
    end
  end
  # 有延时成绩的列表
  def result_delay
    @results = Result.where(:has_exception => 1, :exception_handle => false).paginate(:page => params[:page], :per_page => 20)
  end

  # distribute exam to student
  def exam
    session[:user_id] = params[:id]
    
    redirect_to new_result_paper_path
  end

  # 查询学生
  def search_index
    # 所有激活的学生
    @users = User.where(:role => 1, :is_activity => true).where(" name = ?", params[:name]).order("email DESC").paginate(:page => params[:page], :per_page => 20)
    # 所有激活的督导
    @active_jpms = User.where(:role => 4, :is_activity => true).order("email DESC")
    # 所有激活的客户经理
    @active_spms = User.where(:role => 5, :is_activity => true).order("email DESC")
  end

end
