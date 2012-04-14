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
    # 没有身份
    def authorize_no_role!
      unless current_user.role == 0
        flash[:alert] = "您的登录身份太低,不能完成次操作"
        redirect_to root_path
      end
    end
    # 过滤 不能是学生
    def authorize_not_student!
      authenticate_user!
      authorize_no_role!
      unless current_user.role == 1
        flash[:alert] = "您的登录身份必须为助理以上级别才能完成次操作"
        redirect_to root_path
      end
    end 
  
end
