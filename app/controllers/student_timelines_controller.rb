# encoding: utf-8
# 学生时间线
class StudentTimelinesController < ApplicationController
  before_filter :authorize_not_student!
  before_filter :find_student
  # GET /student_timelines
  # GET /student_timelines.json
  def index
    @student_timelines = StudentTimeline.where(:student_id => @student.id)
      .order('created_at desc')
      .paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @student_timelines }
    end
  end

  # GET /student_timelines/1
  # GET /student_timelines/1.json
  def show
    @student_timeline = StudentTimeline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @student_timeline }
    end
  end

  # GET /student_timelines/new
  # GET /student_timelines/new.json
  def new
    @student_timeline = StudentTimeline.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @student_timeline }
    end
  end

  # GET /student_timelines/1/edit
  def edit
    @student_timeline = StudentTimeline.find(params[:id])
  end

  # POST /student_timelines
  # POST /student_timelines.json
  def create
    @student_timeline = StudentTimeline.new(params[:student_timeline])
    date1 = DateTime.strptime(params[:student_timeline][:arrival_time] + " CCT", "%Y-%m-%d %H:%M %Z")
    date2 = DateTime.strptime(params[:student_timeline][:leave_time] + " CCT", "%Y-%m-%d %H:%M %Z")
    
    @student_timeline.arrival_time = date1
    @student_timeline.leave_time = date2
    
    @student_timeline.student = @student
    @student_timeline.jpm = current_user
    respond_to do |format|
      if @student_timeline.save
        format.html { redirect_to student_student_timelines_path(@student), notice: 'Student timeline was successfully created.' }
        format.json { render json: student_student_timelines_path(@student), status: :created, location: @student_timeline }
      else
        format.html { render action: "new" }
        format.json { render json: @student_timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /student_timelines/1
  # PUT /student_timelines/1.json
  def update
    @student_timeline = StudentTimeline.find(params[:id])
    date1 = DateTime.strptime(params[:student_timeline][:arrival_time] + " CCT", "%Y-%m-%d %H:%M %Z")
    params[:student_timeline][:arrival_time] = date1
    date2 = DateTime.strptime(params[:student_timeline][:leave_time] + " CCT", "%Y-%m-%d %H:%M %Z")
    params[:student_timeline][:leave_time] = date2
    respond_to do |format|
      if @student_timeline.update_attributes(params[:student_timeline])
        format.html { redirect_to student_student_timeline_path(@student,@student_timeline), notice: 'Student timeline was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @student_timeline.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /student_timelines/1
  # DELETE /student_timelines/1.json
  def destroy
    @student_timeline = StudentTimeline.find(params[:id])
    @student_timeline.destroy

    respond_to do |format|
      format.html { redirect_to student_student_timelines_path(@student) }
      format.json { head :no_content }
    end
  end
  
  private

  def find_student
    @student = User.find(params[:student_id])
  end
end