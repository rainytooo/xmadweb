# encoding: utf-8
class CourseContentsController < ApplicationController
  before_filter :authorize_not_student!
  before_filter :authorize_activity!
  before_filter :find_student
  before_filter :find_dairy_plan
  before_filter :check_exist_course_content_with_same_course_num, :only => [:create]
  # GET /course_contents
  # GET /course_contents.json
  def index
    @course_contents = CourseContent.where(:student_id => @student.id, :dairy_plan_id => @dairy_plan.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @course_contents }
    end
  end

  # GET /course_contents/1
  # GET /course_contents/1.json
  def show
    @course_content = CourseContent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @course_content }
    end
  end

  # GET /course_contents/new
  # GET /course_contents/new.json
  def new
    @course_content = CourseContent.new
    @course_num = params[:course_num].to_i
    # 查询出所有的教材标签
    @teaching_exam_tags = TeachingMaterial.exam_counts   
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course_content }
    end
  end
  
  # TODO 给fullcalendar异步调用 获取指定日期内的课程内容安排
  def get_course_content_json
    # 拿出时间start 和 end
    #start_sec = params[:start]
    #puts start_sec
  end

  # GET /course_contents/1/edit
  def edit
    @course_content = CourseContent.find(params[:id])
    @course_num = params[:course_num].to_i
    # 查询出所有的教材标签
    @teaching_exam_tags = TeachingMaterial.exam_counts
  end

  # POST /course_contents
  # POST /course_contents.json
  def create
    @course_content = CourseContent.new(params[:course_content])  
    # 日期 学生 客户经理 教学计划 
    @course_content.plan_date = @dairy_plan.plan_date
    @course_content.student = @student
    @course_content.spm = @dairy_plan.spm
    @course_content.dairy_plan = @dairy_plan
    # 如果是上课 
    if @course_content.action_type.to_s == '1'
      @course_content.teaching_material_id = params[:s_teaching_material_tag_name] ? params[:s_teaching_material_tag_name] : nil
      @course_content.lesson_id = params[:s_lesson_tag_name] ? params[:s_lesson_tag_name] : nil
    end
    # 如果是背单词
    if @course_content.action_type.to_s == '2'
      @course_content.word_material_id = params[:s_word_material_tag_name] ? params[:s_word_material_tag_name] : nil
      @course_content.word_counts = params[:s_word_lesson_tag_name] ? params[:s_word_lesson_tag_name] : nil
    end
    respond_to do |format|
      if @course_content.save
        format.html { redirect_to student_dairy_plan_path(@student,@dairy_plan), notice: '成功创建课程安排' }
        format.json { render json: student_dairy_plan_path(@student,@dairy_plan), status: :created, location: @course_content }
      else
        format.html { render action: "new" }
        format.json { render json: @course_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /course_contents/1
  # PUT /course_contents/1.json
  def update
    @course_content = CourseContent.find(params[:id])
    update_attr = {}
    # 如果是上课 
    update_attr[:action_type] = params[:course_content][:action_type].to_i
    if params[:course_content][:action_type].to_s == '1'
      puts 'asdasdasdas'
      update_attr[:teaching_material_id] = params[:s_teaching_material_tag_name] ? params[:s_teaching_material_tag_name] : nil
      update_attr[:lesson_id] = params[:s_lesson_tag_name] ? params[:s_lesson_tag_name] : nil
    end
    # 如果是背单词
    if params[:course_content][:action_type].to_s == '2'
      update_attr[:word_material_id] = params[:s_word_material_tag_name] ? params[:s_word_material_tag_name] : nil
      update_attr[:word_counts] =params[:s_word_lesson_tag_name] ? params[:s_word_lesson_tag_name] : nil
    end
    respond_to do |format|
      if @course_content.update_attributes(update_attr)
        format.html { redirect_to student_dairy_plan_path(@student,@dairy_plan), notice: 'Course content was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @course_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_contents/1
  # DELETE /course_contents/1.json
  def destroy
    @course_content = CourseContent.find(params[:id])
    @course_content.destroy

    respond_to do |format|
      format.html { redirect_to student_dairy_plan_path(@student,@dairy_plan) }
      format.json { head :no_content }
    end
  end
  private

  def find_student
    @student = User.find(params[:student_id])
  end
  # 查找计划
  def find_dairy_plan
    @dairy_plan = DairyPlan.find(params[:dairy_plan_id])
  end
  # 查看是否有相同时间段的课程计划
  def check_exist_course_content_with_same_course_num
    course_num = params[:course_content][:course_num]
    course_count_check = CourseContent.where(:dairy_plan_id => @dairy_plan.id, :course_num => course_num)   
    if course_count_check.size > 0
      flash[:notice] = "这节课已经存在,不能在同一时间段做两个课程计划"
      redirect_to student_dairy_plans_path(@student)
    end
  end
end
