# encoding: utf-8
class CourseContentsController < ApplicationController
  before_filter :find_student
  before_filter :find_dairy_plan
  # GET /course_contents
  # GET /course_contents.json
  def index
    @course_contents = CourseContent.all

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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @course_content }
    end
  end

  # GET /course_contents/1/edit
  def edit
    @course_content = CourseContent.find(params[:id])
  end

  # POST /course_contents
  # POST /course_contents.json
  def create
    @course_content = CourseContent.new(params[:course_content])

    respond_to do |format|
      if @course_content.save
        format.html { redirect_to @course_content, notice: 'Course content was successfully created.' }
        format.json { render json: @course_content, status: :created, location: @course_content }
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

    respond_to do |format|
      if @course_content.update_attributes(params[:course_content])
        format.html { redirect_to @course_content, notice: 'Course content was successfully updated.' }
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
      format.html { redirect_to course_contents_url }
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
end
