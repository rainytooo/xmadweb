# encoding: utf-8
class StudentsController < ApplicationController
  before_filter :authorize_not_student!
  def index
    @users = User.where("role = 1").order("email DESC")
  end
end
