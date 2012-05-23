# encoding: utf-8
class ExtAttributesController < ApplicationController
  before_filter :authorize_not_student!
  before_filter :authorize_activity!
  before_filter :find_student
  before_filter :check_exist, :only => [:create, :new]
  # GET /ext_attributes
  # GET /ext_attributes.json
  def index
    @ext_attribute = ExtAttribute.where(:student_id => @student.id).first
    if @ext_attribute
      redirect_to student_ext_attribute_path(@student,@ext_attribute)
    end
  end

  # GET /ext_attributes/1
  # GET /ext_attributes/1.json
  def show
    @ext_attribute = ExtAttribute.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ext_attribute }
    end
  end

  # GET /ext_attributes/new
  # GET /ext_attributes/new.json
  def new
    @ext_attribute = ExtAttribute.new
    @teachers = User.where(:role => 2, :is_activity => true).order("email DESC")
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ext_attribute }
    end
  end

  # GET /ext_attributes/1/edit
  def edit
    @teachers = User.where(:role => 2, :is_activity => true).order("email DESC")
    @ext_attribute = ExtAttribute.find(params[:id])
  end

  # POST /ext_attributes
  # POST /ext_attributes.json
  def create
    @ext_attribute = ExtAttribute.new(params[:ext_attribute])
    @ext_attribute.student = @student
    @ext_attribute.total_class_count = @ext_attribute.listen_course_count.to_i + @ext_attribute.read_course_count.to_i + @ext_attribute.write_course_count.to_i + @ext_attribute.speak_course_count.to_i + @ext_attribute.completion_course_count.to_i + @ext_attribute.syntax_course_count.to_i
    @ext_attribute.total_goal_score = @ext_attribute.listen_goal_score.to_i + @ext_attribute.read_goal_score.to_i + @ext_attribute.write_goal_score.to_i + @ext_attribute.speak_goal_score.to_i + @ext_attribute.completion_goal_score.to_i + @ext_attribute.syntax_goal_score.to_i
    respond_to do |format|
      if @ext_attribute.save
        format.html { redirect_to student_ext_attributes_path(@student), notice: 'Ext attribute was successfully created.' }
        format.json { render json: student_ext_attributes_path(@student), status: :created, location: @ext_attribute }
      else
        format.html { render action: "new" }
        format.json { render json: @ext_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ext_attributes/1
  # PUT /ext_attributes/1.json
  def update
    @ext_attribute = ExtAttribute.find(params[:id])
    @ext_attribute.total_class_count = @ext_attribute.listen_course_count.to_i + @ext_attribute.read_course_count.to_i + @ext_attribute.write_course_count.to_i + @ext_attribute.speak_course_count.to_i + @ext_attribute.completion_course_count.to_i + @ext_attribute.syntax_course_count.to_i
    @ext_attribute.total_goal_score = @ext_attribute.listen_goal_score.to_i + @ext_attribute.read_goal_score.to_i + @ext_attribute.write_goal_score.to_i + @ext_attribute.speak_goal_score.to_i + @ext_attribute.completion_goal_score.to_i + @ext_attribute.syntax_goal_score.to_i
    params[:ext_attribute][:total_class_count] = @ext_attribute.total_class_count
    params[:ext_attribute][:total_goal_score] = @ext_attribute.total_goal_score
    respond_to do |format|
      if @ext_attribute.update_attributes(params[:ext_attribute])
        format.html { redirect_to student_ext_attribute_path(@student,@ext_attribute), notice: 'Ext attribute was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ext_attribute.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ext_attributes/1
  # DELETE /ext_attributes/1.json
  def destroy
    @ext_attribute = ExtAttribute.find(params[:id])
    @ext_attribute.destroy
    respond_to do |format|
      format.html { redirect_to student_ext_attributes_path(@student) }
      format.json { head :no_content }
    end
  end
  
  private

  def find_student
    @student = User.find(params[:student_id])
  end
  
  def check_exist
    ext_attribute = ExtAttribute.where(:student_id => @student.id).first
    if ext_attribute
      flash[:notice] = "不能创建多个学生附加属性"
      redirect_to student_ext_attributes_path(@student)
    end
  end
end
