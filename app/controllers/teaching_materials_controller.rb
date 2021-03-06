# encoding: utf-8
# 教材
class TeachingMaterialsController < ApplicationController
  before_filter :authorize_not_student!
  before_filter :authorize_activity!
  # GET /teaching_materials
  # GET /teaching_materials.json
  def index
    @teaching_materials = TeachingMaterial.order("created_at desc").paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teaching_materials }
    end
  end

  # GET /teaching_materials/1
  # GET /teaching_materials/1.json
  def show
    @teaching_material = TeachingMaterial.find(params[:id])
    #@tags = TeachingMaterial.tag_counts_on(:exams)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teaching_material }
    end
  end
  # 按名称搜索
  def search_by_tag_name
    @teaching_materials = TeachingMaterial.tagged_with(params[:name], :any => true)
    @tagname = params[:name]
    #@tags_subjects = TeachingMaterial.subject_counts
  end
  # 所有标签
  def alltags
    @exam_tags = TeachingMaterial.exam_counts
    @subject_tags = TeachingMaterial.subject_counts
  end
  # 级联选择的时候用的
  def tagselect
    course_exam_type_id = params[:s_course_exam_type] 
    teaching_material_id = params[:s_teaching_material_tag_name]
    word_exam_type_id = params[:s_word_exam_type] 
    word_material_id = params[:s_word_material_tag_name]
    # 如果是选择了考试类型 则返回相应的教材
    if course_exam_type_id
      teaching_materials = TeachingMaterial.tagged_with(course_exam_type_id, :any => true)
      @json_str  = Hash[teaching_materials.collect{ |p| [p.id, p.name] }]
    end
    if word_exam_type_id
      teaching_materials = TeachingMaterial.tagged_with(word_exam_type_id, :any => true)
      @json_str  = Hash[teaching_materials.collect{ |p| [p.id, p.name] }]
    end
    # 如果是选择了教材
    if teaching_material_id
      # 拿出这个教材下的所有课程
      lessons = Lesson.where(:teaching_material_id => teaching_material_id).order("created_at desc")
      @json_str  = Hash[lessons.collect{ |p| [p.id, p.name] }]
    end
    if word_material_id
      # 拿出这个教材下的所有课程
      lessons = Lesson.where(:teaching_material_id => word_material_id).order("created_at desc")
      @json_str  = Hash[lessons.collect{ |p| [p.id, p.name] }]
    end
    
    render :json => @json_str
  end
  
 

  # GET /teaching_materials/new
  # GET /teaching_materials/new.json
  def new
    @teaching_material = TeachingMaterial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teaching_material }
    end
  end

  # GET /teaching_materials/1/edit
  def edit
    @teaching_material = TeachingMaterial.find(params[:id])
  end

  # POST /teaching_materials
  # POST /teaching_materials.json
  def create
    @teaching_material = TeachingMaterial.new(params[:teaching_material])

    respond_to do |format|
      if @teaching_material.save
        format.html { redirect_to @teaching_material, notice: 'Teaching material was successfully created.' }
        format.json { render json: @teaching_material, status: :created, location: @teaching_material }
      else
        format.html { render action: "new" }
        format.json { render json: @teaching_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teaching_materials/1
  # PUT /teaching_materials/1.json
  def update
    @teaching_material = TeachingMaterial.find(params[:id])

    respond_to do |format|
      if @teaching_material.update_attributes(params[:teaching_material])
        format.html { redirect_to @teaching_material, notice: 'Teaching material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @teaching_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teaching_materials/1
  # DELETE /teaching_materials/1.json
  def destroy
    @teaching_material = TeachingMaterial.find(params[:id])
    @teaching_material.destroy

    respond_to do |format|
      format.html { redirect_to teaching_materials_url }
      format.json { head :no_content }
    end
  end
end
