# encoding: utf-8
# 教学问题
class TeachingProblemsController < ApplicationController
  before_filter :authorize_not_student!
  before_filter :authorize_activity!
  # GET /teaching_problems
  # GET /teaching_problems.json
  def index
    @teaching_problems = TeachingProblem.where(:sloved => false).order("created_at DESC").paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teaching_problems }
    end
  end

  # GET /teaching_problems/1
  # GET /teaching_problems/1.json
  def show
    @teaching_problem = TeachingProblem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teaching_problem }
    end
  end
  
  # 按名称搜索
  def search_by_tag_name
    @teaching_problems = TeachingProblem.tagged_with(params[:name], :any => true).paginate(:page => params[:page], :per_page => 20)
    @tagname = params[:name]
  end
  # 已经关闭的问题
  def closed
    @teaching_problems = TeachingProblem.where(:sloved => true).order("created_at DESC").paginate(:page => params[:page], :per_page => 20)
  end

  # GET /teaching_problems/new
  # GET /teaching_problems/new.json
  def new
    @students = User.where(:role => 1, :is_activity => true).order("email DESC")
    @teachers = User.where(:role => 2, :is_activity => true).order("email DESC")
    @teaching_problem = TeachingProblem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teaching_problem }
    end
  end

  # GET /teaching_problems/1/edit
  def edit
    @students = User.where(:role => 1, :is_activity => true).order("email DESC")
    @teachers = User.where(:role => 2, :is_activity => true).order("email DESC")
    @teaching_problem = TeachingProblem.find(params[:id])
  end

  # POST /teaching_problems
  # POST /teaching_problems.json
  def create
    @teaching_problem = TeachingProblem.new(params[:teaching_problem])
    #@teaching_problem.student = User.find(params[:student])
    #@teaching_problem.teacher = User.find(params[:teacher])
    respond_to do |format|
      if @teaching_problem.save
        format.html { redirect_to @teaching_problem, notice: 'Teaching problem was successfully created.' }
        format.json { render json: @teaching_problem, status: :created, location: @teaching_problem }
      else
        format.html { render action: "new" }
        format.json { render json: @teaching_problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teaching_problems/1
  # PUT /teaching_problems/1.json
  def update
    @teaching_problem = TeachingProblem.find(params[:id])

    respond_to do |format|
      if @teaching_problem.update_attributes(params[:teaching_problem])
        format.html { redirect_to @teaching_problem, notice: 'Teaching problem was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @teaching_problem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teaching_problems/1
  # DELETE /teaching_problems/1.json
  def destroy
    @teaching_problem = TeachingProblem.find(params[:id])
    @teaching_problem.destroy

    respond_to do |format|
      format.html { redirect_to teaching_problems_url }
      format.json { head :no_content }
    end
  end
end
