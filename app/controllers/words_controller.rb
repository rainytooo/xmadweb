# encoding: utf-8
class WordsController < ApplicationController
  before_filter :authorize_not_student!
  before_filter :authorize_activity!

  def index
    @words = Word.paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @words }
    end
  end

  def show
    @word = Word.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @word }
    end
  end

  def new
    @word = Word.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @word }
    end
  end

  # GET /words/1/edit
  def edit
    @word = Word.find(params[:id])
  end

  def create
    @word = Word.new(params[:word])

    respond_to do |format|
      if @word.save
        format.html { redirect_to @word, notice: 'Word was successfully created.' }
        format.json { render json: @word, status: :created, location: @word }
      else
        format.html { render action: "new" }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @word = Word.find(params[:id])

    respond_to do |format|
      if @word.update_attributes(params[:word])
        format.html { redirect_to @word, notice: 'Word was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @word.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @word = Word.find(params[:id])
    @word.destroy

    respond_to do |format|
      format.html { redirect_to words_url }
      format.json { head :no_content }
    end
  end

  # 清空所有单词相关数据
  def delete_all
    ActiveRecord::Base.connection.execute("truncate words")
    ActiveRecord::Base.connection.execute("truncate meanings")
    ActiveRecord::Base.connection.execute("truncate papers")
    ActiveRecord::Base.connection.execute("truncate paper_words")
    ActiveRecord::Base.connection.execute("truncate result_words")
    ActiveRecord::Base.connection.execute("truncate result_papers")
    ActiveRecord::Base.connection.execute("truncate exams")

    respond_to do |format|
      format.html { redirect_to words_url, notice: "考试相关所有数据全部重置！" }
      format.json { head :no_content }
    end
  end
end
