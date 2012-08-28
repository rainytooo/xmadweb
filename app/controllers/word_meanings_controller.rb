class WordMeaningsController < ApplicationController
  before_filter :authorize_not_student!
  before_filter :authorize_activity!
  # GET /word_meanings
  # GET /word_meanings.json
  def index
    @words = Word.paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @word_meanings }
    end
  end

  # GET /word_meanings/1
  # GET /word_meanings/1.json
  def show
    @word_meaning = WordMeaning.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @word_meaning }
    end
  end

  # GET /word_meanings/new
  # GET /word_meanings/new.json
  def new
    @word_meaning = WordMeaning.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @word_meaning }
    end
  end

  # GET /word_meanings/1/edit
  def edit
    @word_meaning = WordMeaning.find(params[:id])
  end

  # POST /word_meanings
  # POST /word_meanings.json
  def create
    @word_meaning = WordMeaning.new(params[:word_meaning])

    respond_to do |format|
      if @word_meaning.save
        format.html { redirect_to @word_meaning, notice: 'Word meaning was successfully created.' }
        format.json { render json: @word_meaning, status: :created, location: @word_meaning }
      else
        format.html { render action: "new" }
        format.json { render json: @word_meaning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /word_meanings/1
  # PUT /word_meanings/1.json
  def update
    @word_meaning = WordMeaning.find(params[:id])

    respond_to do |format|
      if @word_meaning.update_attributes(params[:word_meaning])
        format.html { redirect_to @word_meaning, notice: 'Word meaning was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @word_meaning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /word_meanings/1
  # DELETE /word_meanings/1.json
  def destroy
    @word_meaning = WordMeaning.find(params[:id])
    @word_meaning.destroy

    respond_to do |format|
      format.html { redirect_to word_meanings_url }
      format.json { head :no_content }
    end
  end
end
