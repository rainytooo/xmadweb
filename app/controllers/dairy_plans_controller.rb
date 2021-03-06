# encoding: utf-8
class DairyPlansController < ApplicationController
  before_filter :authorize_not_student!
  before_filter :authorize_activity!
  before_filter :find_student
  before_filter :get_student_course_count_sp
  before_filter :get_student_ext_attributes
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
    @simple_view = params[:cal] ? false : true
    # 查询所有的课程内容安排  一天五节课
    @course_content_1 = CourseContent.where(:dairy_plan_id => @dairy_plan.id, :course_num => 1).first
    @course_content_2 = CourseContent.where(:dairy_plan_id => @dairy_plan.id, :course_num => 2).first
    @course_content_3 = CourseContent.where(:dairy_plan_id => @dairy_plan.id, :course_num => 3).first
    @course_content_4 = CourseContent.where(:dairy_plan_id => @dairy_plan.id, :course_num => 4).first
    @course_content_5 = CourseContent.where(:dairy_plan_id => @dairy_plan.id, :course_num => 5).first
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @dairy_plan }
    end
  end
  # calendar的json数据获取
  def get_plan_json
    # 查询所有此学生的计划
    @dairy_plans = DairyPlan.where("student_id = ? and ( plantype is null or plantype = ? ) ", @student.id, 1  )
    @json_array = []
    @dairy_plans.each do |plan|
      obj_hash = plan.attributes
      obj_hash[:title] = "上课 查看详细"
      obj_hash[:start] = plan.plan_date.strftime('%Y-%m-%d')
      obj_hash[:url] = student_dairy_plan_url(@student, plan)
      @json_array.push obj_hash
    end
    #@hash_org = @dairy_plans.to_hash
    render:json => @json_array
  end
  
  def get_plan_json_for_exam
    # 查询所有此学生的计划
    @dairy_plans = DairyPlan.where("student_id = ? and plantype = ?", @student.id, 2)
    @json_array = []
    @dairy_plans.each do |plan|
      obj_hash = plan.attributes
      obj_hash[:title] = "正式考试"
      obj_hash[:start] = plan.plan_date.strftime('%Y-%m-%d')
      obj_hash[:url] = student_dairy_plan_url(@student, plan)
      @json_array.push obj_hash
    end
    #@hash_org = @dairy_plans.to_hash
    render:json => @json_array
  end
  
  # json 查询有模拟考试的
  def get_plan_json_for_mockexam
    # 查询所有此学生的计划
    
    # course_contents = CourseContent.where("student_id = ? and action_type = ?", @student.id, 5)
    @dairy_plans = DairyPlan.joins(:course_contents).where("course_contents.student_id = ? and course_contents.action_type = ?", @student.id, 5)
    #.where("student_id = ? and plantype = ?", @student.id, 2)
    @json_array = []
    @dairy_plans.each do |plan|
      obj_hash = plan.attributes
      obj_hash[:title] = "有模拟考试"
      obj_hash[:start] = plan.plan_date.strftime('%Y-%m-%d')
      obj_hash[:url] = student_dairy_plan_url(@student, plan)
      @json_array.push obj_hash
    end
    #@hash_org = @dairy_plans.to_hash
    render:json => @json_array
  end
  
  # 获取学生成绩
  def get_result_json
    @json_results = Result.where(:student_id => @student.id)
    @json_array = []
    @json_results.each do |result|
        obj_hash = result.attributes
        obj_hash[:title] = "课后成绩"
        obj_hash[:start] = result.result_date.strftime('%Y-%m-%d')
        obj_hash[:url] = student_result_url(@student, result)
        @json_array.push obj_hash
    end
    #@hash_org = @dairy_plans.to_hash
    render:json => @json_array
  end
  
  # 
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
        # 更新所有此计划下的课程
        CourseContent.where(:dairy_plan_id => @dairy_plan.id).update_all(:plan_date => date1)
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
    # 先删除所有课程
    CourseContent.where(:dairy_plan_id => params[:id]).delete_all
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
