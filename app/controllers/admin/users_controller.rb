# encoding: utf-8
# 管理员操作控制器
class Admin::UsersController < Admin::BaseController
  before_filter :find_user, :only => [:show, :edit, :update, :destroy, :activity]
  
  def index
    @users = User.paginate(:page => params[:page], :per_page => 20)
  end
  
  # 新建用户
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    set_admin
    if @user.save
      flash[:notice] = "用户创建成功."
      redirect_to admin_users_path
    else
      flash[:alert] = "用户创建失败."
      render :action => "new"
    end
  end
  
  # 显示用户
  def show
    
  end
  
  # 编辑用户
  def edit
    
  end
  
  # 完成编辑用户
  def update
    # 如果密码留空,就删除密码
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    set_admin
    if @user.update_attributes(params[:user])
      flash[:notice] = "成功编辑用户."
      redirect_to admin_users_path
    else
      flash[:alert] = "编辑用户失败."
      render :action => "edit"
    end
  end
  
  # 删除用户操作
  def destroy
    if @user == current_user
      flash[:alert] = "你不能删除你自己!"
    else
      @user.destroy
      flash[:notice] = "用户已经成功删除."
    end
    redirect_to admin_users_path
  end
  # 生效或者失效
  def activity
    if @user.is_activity
      @user.update_attributes(:is_activity => false)
    else
      @user.update_attributes(:is_activity => true)
    end
    redirect_to admin_users_path
  end
  
  private

  def find_user
    @user = User.find(params[:id])
  end
  
  def set_admin
    @user.admin = params[:user][:admin] == "1"
  end
  
  
end
