class WordPropertiesController < ApplicationController
  before_filter :authorize_not_student!
  before_filter :authorize_activity!
  # GET /word_properties
  # GET /word_properties.json
  def index
    @word_properties = WordProperty.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @word_properties }
    end
  end

  # GET /word_properties/1
  # GET /word_properties/1.json
  def show
    @word_property = WordProperty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @word_property }
    end
  end

  # GET /word_properties/new
  # GET /word_properties/new.json
  def new
    @word_property = WordProperty.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @word_property }
    end
  end

  # GET /word_properties/1/edit
  def edit
    @word_property = WordProperty.find(params[:id])
  end

  # POST /word_properties
  # POST /word_properties.json
  def create
    @word_property = WordProperty.new(params[:word_property])

    respond_to do |format|
      if @word_property.save
        format.html { redirect_to @word_property, notice: 'Word property was successfully created.' }
        format.json { render json: @word_property, status: :created, location: @word_property }
      else
        format.html { render action: "new" }
        format.json { render json: @word_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /word_properties/1
  # PUT /word_properties/1.json
  def update
    @word_property = WordProperty.find(params[:id])

    respond_to do |format|
      if @word_property.update_attributes(params[:word_property])
        format.html { redirect_to @word_property, notice: 'Word property was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @word_property.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /word_properties/1
  # DELETE /word_properties/1.json
  def destroy
    @word_property = WordProperty.find(params[:id])
    @word_property.destroy

    respond_to do |format|
      format.html { redirect_to word_properties_url }
      format.json { head :no_content }
    end
  end
end
