# encoding: utf-8
class WordCategoriesController < ApplicationController

  def index
    @word_categories = WordCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @word_categories }
    end
  end
  # 分类列表
  # 作者： ryan
  # 添加时间: 2013-4-15
  def list
    @word_lists = WordCategory.all 

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @word_categories }
    end
  end

  def show
    @word_category = WordCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @word_category }
    end
  end


  def new
    @word_category = WordCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @word_category }
    end
  end


  def edit
    @word_category = WordCategory.find(params[:id])
  end


  def create
    @word_category = WordCategory.new(params[:word_category])

    respond_to do |format|
      if @word_category.save
        format.html { redirect_to @word_category, notice: 'Word category was successfully created.' }
        format.json { render json: @word_category, status: :created, location: @word_category }
      else
        format.html { render action: "new" }
        format.json { render json: @word_category.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    @word_category = WordCategory.find(params[:id])

    respond_to do |format|
      if @word_category.update_attributes(params[:word_category])
        format.html { redirect_to @word_category, notice: 'Word category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @word_category.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @word_category = WordCategory.find(params[:id])
    @word_category.destroy

    respond_to do |format|
      format.html { redirect_to word_categories_url }
      format.json { head :no_content }
    end
  end
end
