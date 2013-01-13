# encoding: utf-8
class HomeController < ApplicationController
    def index
    end
  #   def send_mail
  #   	# 验证email
		# before_at = /([a-zA-Z0-9]+(_?[a-zA-Z0-9])+)/  
		# after_at = /(\w)+((\.\w{2,3}){1,3})+/  
		# email = /^(#{before_at}@#{after_at})$/ 
		# email1 = params[:email]
		# # 校验email字段
		# if email1
		# 	if (email =~ email1).nil?
		#     	flash[:notice] = '发送失败，您的email地址不合法!'
		#     else
		#     	TrafficMailer.send_traffic(email1).deliver
		#     	flash[:notice] = '发送成功!'
		# 	end
		# 	redirect_to root_url
		# end
  #   end
end
