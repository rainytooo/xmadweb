# encoding:utf-8
class VocabularyMeaningsController < ApplicationController
  
  # maintain vocabulary meanings
  # author: Ryan 
  # 2013-04-16
  def index
    @vocabulary = Vocabulary.find(params[:vocabulary_id])
    @vocabulary_meanings = @vocabulary.vocabulary_meanings

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vocabulary_meanings }
    end
  end

  def show
    @vocabulary = Vocabulary.find(params[:vocabulary_id])
    @vocabulary_meaning = @vocabulary.vocabulary_meanings.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vocabulary_meaning }
    end
  end

  def new
    @vocabulary = Vocabulary.find(params[:vocabulary_id])
    @vocabulary_meaning = @vocabulary.vocabulary_meanings.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vocabulary_meaning }
    end
  end

  def edit
    @vocabulary = Vocabulary.find(params[:vocabulary_id])
    @vocabulary_meaning = @vocabulary.vocabulary_meanings.find(params[:id])
  end

  # 修订添加重复的意思
  # author Ryan
  # 2013-04-17
  def create
    @vocabulary = Vocabulary.find(params[:vocabulary_id])
    flag = false
    @vocabulary.vocabulary_meanings.each do |m|
      if m.content == params[:vocabulary_meaning]['content']
        flag = true
      end
    end
      
      @vocabulary_meaning = @vocabulary.vocabulary_meanings.new(params[:vocabulary_meaning])
      respond_to do |format|
        if flag
          format.html { redirect_to vocabulary_vocabulary_meanings_url, notice: '单词意思已经添加.' }
        elsif @vocabulary_meaning.save
          format.html { redirect_to [@vocabulary, @vocabulary_meaning], notice: '给单词添加新意思成功.' }
          format.json { render json: [@vocabulary, @vocabulary_meaning], status: :created, location: @vocabulary_meaning }
        else
          format.html { render action: "new" }
          format.json { render json: @vocabulary_meaning.errors, status: :unprocessable_entity }
        end
      end
  end


  def update
    @vocabulary = Vocabulary.find(params[:vocabulary_id])
    @vocabulary_meaning = @vocabulary.vocabulary_meanings.find(params[:id])

    respond_to do |format|
      if @vocabulary_meaning.update_attributes(params[:vocabulary_meaning])
        format.html { redirect_to [@vocabulary, @vocabulary_meaning], notice: '单词的意思更新成功.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vocabulary_meaning.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @vocabulary = Vocabulary.find(params[:vocabulary_id])
    @vocabulary_meaning = @vocabulary.vocabulary_meanings.find(params[:id])
    @vocabulary_meaning.destroy

    respond_to do |format|
      format.html { redirect_to vocabulary_vocabulary_meanings_url }
      format.json { head :no_content }
    end
  end

end
