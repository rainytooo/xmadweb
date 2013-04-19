class VocabulariesController < ApplicationController

  def index
    @vocabularies = Vocabulary.paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vocabularies }
    end
  end

  # GET /vocabularies/1
  # GET /vocabularies/1.json
  def show
    @vocabulary = Vocabulary.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vocabulary }
    end
  end

  # GET /vocabularies/new
  # GET /vocabularies/new.json
  def new
    @vocabulary = Vocabulary.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vocabulary }
    end
  end

  # GET /vocabularies/1/edit
  def edit
    @vocabulary = Vocabulary.find(params[:id])
  end

  # POST /vocabularies
  # POST /vocabularies.json
  def create
    @vocabulary = Vocabulary.new(params[:vocabulary])

    respond_to do |format|
      if @vocabulary.save
        format.html { redirect_to @vocabulary, notice: 'Vocabulary was successfully created.' }
        format.json { render json: @vocabulary, status: :created, location: @vocabulary }
      else
        format.html { render action: "new" }
        format.json { render json: @vocabulary.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vocabularies/1
  # PUT /vocabularies/1.json
  def update
    @vocabulary = Vocabulary.find(params[:id])

    respond_to do |format|
      if @vocabulary.update_attributes(params[:vocabulary])
        format.html { redirect_to @vocabulary, notice: 'Vocabulary was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vocabulary.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vocabularies/1
  # DELETE /vocabularies/1.json
  def destroy
    @vocabulary = Vocabulary.find(params[:id])
    @vocabulary.destroy

    respond_to do |format|
      format.html { redirect_to vocabularies_url }
      format.json { head :no_content }
    end
  end
end
