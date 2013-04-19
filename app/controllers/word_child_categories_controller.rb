# encoding: utf-8
class WordChildCategoriesController < ApplicationController

  # 上传词汇和意思
  # author: Ryan
  # 2013-04-16
  def list
    @word_category = WordCategory.find(params[:word_category_id]);
    @word_child_categories = @word_category.word_child_categories
  end


  # 显示试卷
  # author: Ryan
  # 2013-04-17
  def show_word
    @word_category = WordCategory.find(params[:word_category_id]);
    @word_child_category = @word_category.word_child_categories.find(params[:id])
    @word_list = @word_child_category.vocabularies
  end

  def index
    @word_category = WordCategory.find(params[:word_category_id]);
    @word_child_categories = @word_category.word_child_categories

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @word_child_categories }
    end
  end

  # 上传词汇和意思
  # author: Ryan
  # 2013-04-16
  def upload_word
    @word_category = WordCategory.find(params[:word_category_id]);
    @word_child_category = @word_category.word_child_categories.find(params[:id]);
  end


  # 保存上传词汇和意思
  # author: Ryan
  # 2013-04-16
  # 
  # 修改bug，没有选择文件不能上传
  # 2013-04-17
  def save_upload
    @word_category = WordCategory.find(params[:word_category_id]);
    @word_child_category = @word_category.word_child_categories.find(params[:id]);
    upload = params['upload_file']
    if !upload.nil?
      begin
          orig_name = upload.original_filename
          base_name = File.basename(orig_name, ".*")    # 取得文件名字
          ext_name = File.extname(orig_name) # 取得文件扩展名
          file_name = base_name + ext_name

          FileUtils.mkpath(upload_path) unless File.directory?(upload_path)
          if upload.kind_of?(StringIO)
             upload.rewind
          end

          if ext_name == ".xls"
             # 将文件写入磁盘
             File.open(upload_path(file_name), "wb") { |f| f.write(upload.read) }
             #
             store_data("upload/vocabulary/#{file_name.nil? ? '' : file_name}", @word_child_category.id)
             respond_to do |format|
               format.html { redirect_to [@word_category, @word_child_category], notice: "上传成功!!" }
             end
          else
             respond_to do |format|
                 format.html { redirect_to root_url, notice: "对不起，文件不是'.xls' !" }
             end
          end
      rescue
          raise
      end
    else
      redirect_to :back, :notice => "您未选择上传文件"
    end
  end

  def upload_path(file_name=nil)
    "upload/vocabulary/#{file_name.nil? ? '' : file_name}"
  end

  def show
    @word_category = WordCategory.find(params[:word_category_id]);
    @word_child_category = @word_category.word_child_categories.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @word_child_category }
    end
  end

  def new
    @word_category = WordCategory.find(params[:word_category_id]);
    @word_child_category = @word_category.word_child_categories.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @word_child_category }
    end
  end

  def edit
    @word_category = WordCategory.find(params[:word_category_id]);
    @word_child_category = @word_category.word_child_categories.find(params[:id])
  end

  def create
    @word_category = WordCategory.find(params[:word_category_id]);
    @word_child_category = @word_category.word_child_categories.new(params[:word_child_category])

    respond_to do |format|
      if @word_child_category.save
        format.html { redirect_to [@word_category, @word_child_category], notice: 'Word child category was successfully created.' }
        format.json { render json: @word_child_category, status: :created, location: @word_child_category }
      else
        format.html { render action: "new" }
        format.json { render json: @word_child_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @word_category = WordCategory.find(params[:word_category_id]);
    @word_child_category = @word_category.word_child_categories.find(params[:id])

    respond_to do |format|
      if @word_child_category.update_attributes(params[:word_child_category])
        format.html { redirect_to [@word_category, @word_child_category], notice: 'Word child category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @word_child_category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @word_category = WordCategory.find(params[:word_category_id]);
    @word_child_category = @word_category.word_child_categories.find(params[:id])
    @word_child_category.destroy

    respond_to do |format|
      format.html { redirect_to word_category_word_child_category_path(@word_category) }
      format.json { head :no_content }
    end
  end


  private 
    # 保存数据
    def store_data(source_name, id)
        Spreadsheet.client_encoding = "UTF-8"
        #保存读取的原excel,使用插件读取
        Spreadsheet.open(source_name, "rb+") do |g|
          # acquire all sheets
        for i in  0..(g.worksheets.size - 1)
              sheet1 = g.worksheet(i)
              sheet1.each do |row|
              if  row[0] && !row[0].strip.empty?
                  WordChildCategory.save_options(id, row)
              end
          end
        end
      end
    end

end
