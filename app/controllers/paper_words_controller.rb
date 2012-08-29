class PaperWordsController < ApplicationController
  before_filter :authorize_not_student!
  before_filter :authorize_activity!
  # GET /paper_words
  # GET /paper_words.json
  def index
    @paper_words = PaperWord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @paper_words }
    end
  end

  # GET /paper_words/1
  # GET /paper_words/1.json
  def show
    @paper_word = PaperWord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @paper_word }
    end
  end

  # GET /paper_words/new
  # GET /paper_words/new.json
  def new
    @paper_word = PaperWord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @paper_word }
    end
  end

  # GET /paper_words/1/edit
  def edit
    @paper_word = PaperWord.find(params[:id])
  end

  # POST /paper_words
  # POST /paper_words.json
  def create
    @paper_word = PaperWord.new(params[:paper_word])

    respond_to do |format|
      if @paper_word.save
        format.html { redirect_to @paper_word, notice: 'Paper word was successfully created.' }
        format.json { render json: @paper_word, status: :created, location: @paper_word }
      else
        format.html { render action: "new" }
        format.json { render json: @paper_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /paper_words/1
  # PUT /paper_words/1.json
  def update
    @paper_word = PaperWord.find(params[:id])

    respond_to do |format|
      if @paper_word.update_attributes(params[:paper_word])
        format.html { redirect_to @paper_word, notice: 'Paper word was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @paper_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /paper_words/1
  # DELETE /paper_words/1.json
  def destroy
    @paper_word = PaperWord.find(params[:id])
    @paper_word.destroy

    respond_to do |format|
      format.html { redirect_to paper_words_url }
      format.json { head :no_content }
    end
  end
end
