# encoding: utf-8
class ApplicationController < ActionController::Base
  
  
  protect_from_forgery

  private
    def authorize_admin!
      authenticate_user!
      unless current_user.admin?
        flash[:alert] = "您的登录身份必须为管理员才能完成次操作"
        redirect_to root_path
      end
    end 

    def authorize_super_admin!
      authenticate_user!
      unless current_user.admin? && [1,57, 330].include?(current_user.id)
        flash[:alert] = "您的登录身份必须为超级管理员才能完成次操作"
        redirect_to root_path
      end
    end 
    
    def authorize_activity!
      authenticate_user!
      unless current_user.is_activity
        flash[:alert] = "您的账号没有激活,已经失效,请联系管理员"
        redirect_to root_path
      end
    end
    
    # 没有身份
    def authorize_no_role!
      unless current_user.role != 0
        flash[:alert] = "您的登录身份太低,不能完成次操作"
        redirect_to root_path
      end
    end
    # 过滤 不能是学生
    def authorize_not_student!
      authenticate_user!
      authorize_no_role!
      unless current_user.role != 1
        flash[:alert] = "您的登录身份必须为助理以上级别才能完成次操作"
        redirect_to root_path
      end
    end 
    # 获取学生消耗的课时
    def get_student_course_count_sp
      #@student = User.find(params[:student_id])
      @sp_count = Hash.new
      @sp_count["listen"] = Result.where(" student_id = ? and  listen_score1 is not null",params[:student_id]).count
      @sp_count["read"] = Result.where(" student_id = ? and  read_score1 is not null",params[:student_id]).count
      @sp_count["write"] = Result.where(" student_id = ? and  write_score1 is not null",params[:student_id]).count
      @sp_count["speak"] = Result.where(" student_id = ? and  spoken_score1 is not null",params[:student_id]).count
      #@sp_count["completion"] = Result.where(" student_id = ? and  listen_score1 is not null",params[:student_id]).count
      #@sp_count["syntax"] = Result.where(" student_id = ? and  listen_score1 is not null",params[:student_id]).count
      @sp_count["total"] = @sp_count["listen"]  + @sp_count["read"] + @sp_count["write"] + @sp_count["speak"] #+ @sp_count["completion"] + @sp_count["syntax"]
    end
    # 查询学生的附加属性 
    def get_student_ext_attributes
      @stu_ext = ExtAttribute.where(:student_id => params[:student_id]).first
    end
  
end
