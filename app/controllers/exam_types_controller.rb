# encoding: utf-8
class ExamTypesController < ApplicationController
  before_filter :authorize_not_student!
  before_filter :authorize_activity!
  # GET /exam_types
  # GET /exam_types.json
  def index
    @exam_types = ExamType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exam_types }
    end
  end

  # GET /exam_types/1
  # GET /exam_types/1.json
  def show
    @exam_type = ExamType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exam_type }
    end
  end

  # GET /exam_types/new
  # GET /exam_types/new.json
  def new
    @exam_type = ExamType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exam_type }
    end
  end

  # GET /exam_types/1/edit
  def edit
    @exam_type = ExamType.find(params[:id])
  end

  # POST /exam_types
  # POST /exam_types.json
  def create
    @exam_type = ExamType.new(params[:exam_type])

    respond_to do |format|
      if @exam_type.save
        format.html { redirect_to @exam_type, notice: 'Exam type was successfully created.' }
        format.json { render json: @exam_type, status: :created, location: @exam_type }
      else
        format.html { render action: "new" }
        format.json { render json: @exam_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exam_types/1
  # PUT /exam_types/1.json
  def update
    @exam_type = ExamType.find(params[:id])

    respond_to do |format|
      if @exam_type.update_attributes(params[:exam_type])
        format.html { redirect_to @exam_type, notice: 'Exam type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exam_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_types/1
  # DELETE /exam_types/1.json
  def destroy
    @exam_type = ExamType.find(params[:id])
    @exam_type.destroy

    respond_to do |format|
      format.html { redirect_to exam_types_url }
      format.json { head :no_content }
    end
  end
end
