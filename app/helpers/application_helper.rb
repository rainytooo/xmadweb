# encoding: utf-8
module ApplicationHelper
  
  # 管理员可进行操作
  def admins_only(&block)
    block.call if current_user.try(:admin?)
    nil
  end
end