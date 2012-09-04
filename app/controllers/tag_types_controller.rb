class TagTypesController < ApplicationController
  # GET /tag_types
  # GET /tag_types.json
  def index
    @tag_types = TagType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tag_types }
    end
  end

  # GET /tag_types/1
  # GET /tag_types/1.json
  def show
    @tag_type = TagType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tag_type }
    end
  end

  # GET /tag_types/new
  # GET /tag_types/new.json
  def new
    @tag_type = TagType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tag_type }
    end
  end

  # GET /tag_types/1/edit
  def edit
    @tag_type = TagType.find(params[:id])
  end

  # POST /tag_types
  # POST /tag_types.json
  def create
    @tag_type = TagType.new(params[:tag_type])

    respond_to do |format|
      if @tag_type.save
        format.html { redirect_to @tag_type, notice: 'Tag type was successfully created.' }
        format.json { render json: @tag_type, status: :created, location: @tag_type }
      else
        format.html { render action: "new" }
        format.json { render json: @tag_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tag_types/1
  # PUT /tag_types/1.json
  def update
    @tag_type = TagType.find(params[:id])

    respond_to do |format|
      if @tag_type.update_attributes(params[:tag_type])
        format.html { redirect_to @tag_type, notice: 'Tag type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tag_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_types/1
  # DELETE /tag_types/1.json
  def destroy
    @tag_type = TagType.find(params[:id])
    @tag_type.destroy

    respond_to do |format|
      format.html { redirect_to tag_types_url }
      format.json { head :no_content }
    end
  end
end
