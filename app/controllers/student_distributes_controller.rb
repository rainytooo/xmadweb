# encoding: utf-8
# 学生的督导分配
class StudentDistributesController < ApplicationController
  before_filter :authorize_not_student!
  before_filter :find_student
  # 查看学生的督导分配情况
  def index

  end
  
  def new
    # 查询所有的督导
    @jpms = User.where(:role => 4)
    # 查询所有的客户经理
    @spms = User.where(:role => 5)
  end

  def create
    pm_params = {}
    # 督导
    if params[:jpm_id]
      # jpm = User.find(params[:jpm_id])
      pm_params[:jpm_id] = params[:jpm_id]
    end
    # 客户经理
    if params[:spm_id]
      # spm = User.find(params[:spm_id])
      pm_params[:spm_id] = params[:spm_id]
    end
    @student.update_attributes(pm_params)
    redirect_to student_student_distributes_path(@student)
  end
  
  private

  def find_student
    @student = User.find(params[:student_id])
  end
end
