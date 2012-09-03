# encoding: utf-8
class MeaningsController < ApplicationController
  before_filter :authorize_not_student!, :except => [:show, :index]
  before_filter :authorize_activity!
  # GET /meanings
  # GET /meanings.json
  def index
    @word = Word.find(params[:word_id])
    @meanings = @word.meanings

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meanings }
    end
  end

  def show
    @meaning = Meaning.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meaning }
    end
  end

  def new
    @word = Word.find(params[:word_id])
    @meaning = @word.meanings.new
  end

  # GET /meanings/1/edit
  def edit
    @meaning = Meaning.find(params[:id])
  end

  # POST /meanings
  # POST /meanings.json
  def create
    @word = Word.find(params[:word_id])
    @meaning = @word.meanings.new(params[:meaning])

    respond_to do |format|
      if @meaning.save
        format.html { redirect_to word_meanings_path(@word), notice: 'Meaning was successfully created.' }
        format.json { render json: @meaning, status: :created, location: @meaning }
      else
        format.html { render action: "new" }
        format.json { render json: @meaning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meanings/1
  # PUT /meanings/1.json
  def update
    @meaning = Meaning.find(params[:id])

    respond_to do |format|
      if @meaning.update_attributes(params[:meaning])
        format.html { redirect_to @meaning, notice: 'Meaning was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meaning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meanings/1
  # DELETE /meanings/1.json
  def destroy
    @meaning = Meaning.find(params[:id])
    @meaning.destroy

    respond_to do |format|
      format.html { redirect_to meanings_url }
      format.json { head :no_content }
    end
  end
end
