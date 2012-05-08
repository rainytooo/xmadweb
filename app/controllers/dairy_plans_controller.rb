# encoding: utf-8
class DairyPlansController < ApplicationController
  before_filter :find_student
  # GET /dairy_plans
  # GET /dairy_plans.json
  def index
    @dairy_plans = DairyPlan.where(:student_id => @student.id)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @dairy_plans }
    end
  end

  # GET /dairy_plans/1
  # GET /dairy_plans/1.json
  def show
    @dairy_plan = DairyPlan.find(params[:id])
    # 查询所有的课程内容安排
    @course_contents = CourseContent.where(:dairy_plan_id => @dairy_plan.id).order("course_num asc")
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dairy_plan }
    end
  end

  # GET /dairy_plans/new
  # GET /dairy_plans/new.json
  def new
    @dairy_plan = DairyPlan.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @dairy_plan }
    end
  end

  # GET /dairy_plans/1/edit
  def edit
    @dairy_plan = DairyPlan.find(params[:id])
  end

  # POST /dairy_plans
  # POST /dairy_plans.json
  def create
    @dairy_plan = DairyPlan.new(params[:dairy_plan])
    @dairy_plan.spm = @student.spm
    @dairy_plan.student = @student
    # 时间处理 需要判断是否填写
    if params[:dairy_plan][:plan_date].to_s != ""
      date1 = DateTime.strptime(params[:dairy_plan][:plan_date] + " CCT", "%Y-%m-%d %Z")   
      @dairy_plan.plan_date = date1
    end
    respond_to do |format|
      if @dairy_plan.save
        format.html { redirect_to student_dairy_plans_path(@student), notice: 'Dairy plan was successfully created.' }
        format.json { render json: student_dairy_plans_path(@student), status: :created, location: @dairy_plan }
      else
        format.html { render action: "new" }
        format.json { render json: @dairy_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /dairy_plans/1
  # PUT /dairy_plans/1.json
  def update
    @dairy_plan = DairyPlan.find(params[:id])
    if params[:dairy_plan][:plan_date].to_s != ""
      date1 = DateTime.strptime(params[:dairy_plan][:plan_date] + " CCT", "%Y-%m-%d %Z")
      params[:dairy_plan][:plan_date] = date1
    end
    respond_to do |format|
      if @dairy_plan.update_attributes(params[:dairy_plan])
        format.html { redirect_to student_dairy_plan_path(@student,@dairy_plan), notice: 'Dairy plan was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @dairy_plan.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dairy_plans/1
  # DELETE /dairy_plans/1.json
  def destroy
    @dairy_plan = DairyPlan.find(params[:id])
    @dairy_plan.destroy

    respond_to do |format|
      format.html { redirect_to student_dairy_plans_url(@student) }
      format.json { head :no_content }
    end
  end
  private

  def find_student
    @student = User.find(params[:student_id])
  end
end
