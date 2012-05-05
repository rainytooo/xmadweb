# encoding: utf-8
class LessonsController < ApplicationController
  before_filter :authorize_not_student!
  before_filter :authorize_activity!
  before_filter :find_teaching_material
  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.where(:teaching_material_id => @teaching_material.id).order("created_at desc").paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lessons }
    end
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    @lesson = Lesson.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lesson }
    end
  end

  # GET /lessons/new
  # GET /lessons/new.json
  def new
    @lesson = Lesson.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lesson }
    end
  end

  # GET /lessons/1/edit
  def edit
    @lesson = Lesson.find(params[:id])
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(params[:lesson])
    @lesson.teaching_material = @teaching_material
    respond_to do |format|
      if @lesson.save
        format.html { redirect_to teaching_material_lessons_path(@teaching_material), notice: 'Lesson was successfully created.' }
        format.json { render json: teaching_material_lessons_path(@teaching_material), status: :created, location: @lesson }
      else
        format.html { render action: "new" }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /lessons/1
  # PUT /lessons/1.json
  def update
    @lesson = Lesson.find(params[:id])

    respond_to do |format|
      if @lesson.update_attributes(params[:lesson])
        format.html { redirect_to teaching_material_lessons_path(@teaching_material), notice: 'Lesson was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson = Lesson.find(params[:id])
    @lesson.destroy

    respond_to do |format|
      format.html { redirect_to teaching_material_lessons_path(@teaching_material) }
      format.json { head :no_content }
    end
  end
  
  def find_teaching_material
    @teaching_material = TeachingMaterial.find(params[:teaching_material_id])
  end
end
