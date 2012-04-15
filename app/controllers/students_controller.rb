# encoding: utf-8
class StudentsController < ApplicationController
  before_filter :authorize_not_student!
  def index
    @users = User.where("role = 1").order("email DESC").paginate(:page => params[:page], :per_page => 20)
  end
end
