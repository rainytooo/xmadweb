# encoding: utf-8
class UploadXmlController < ApplicationController
  before_filter :authorize_not_student!
  before_filter :authorize_activity!

  def index
  end
  # judge the file empty or not
  def upload_file
      if !params['upload_file'].nil?
          file = params['upload_file']
          file_upload(file)
      else
          p "filename is empty!!!"
      end
  end
  #   save the upload file
  def file_upload(upload)
    begin
        FileUtils.mkpath(upload_path) unless File.directory?(upload_path)
        if upload.kind_of?(StringIO)
          upload.rewind
        end

        orig_name = upload.original_filename
        base_name = File.basename(orig_name, ".*")    # 取得文件名字
        ext_name = File.extname(orig_name) # 取得文件扩展名
        if ext_name == ".xls"
            # 重命名
            file_name = base_name + ext_name
            # 将文件写入磁盘
            File.open(upload_path(file_name), "wb") { |f| f.write(upload.read) }
            #
            store_data("upload/#{file_name.nil? ? '' : file_name}")
            respond_to do |format|
              format.html { redirect_to root_url, notice: "upload successfully!!" }
            end
        else
            respond_to do |format|
                format.html { redirect_to root_url, notice: "sorry, file type not '.xls' !" }
            end
        end
    rescue
        raise
    end
  end


  # 生成绝对路径
  def upload_path(file_name = nil)
      "upload/#{file_name.nil? ? '' : file_name}"
  end

  # 获取词性 ----改进 
  def getPt(value)
      case value
          when "n" then  1
          when "v" then  2
          when "vi" then 2
          when "vt" then 2
          when "adj" then 3
          when "adv" then 4
          when "pron" then 5
          when "prep" then 6
      end
  end

  def store_data(source_name)
      Spreadsheet.client_encoding = "UTF-8"
      #保存读取的原excel,使用插件读取
      Spreadsheet.open(source_name, "rb+") do |g|
          # acquire all sheets
          for i in  0..(g.worksheets.size - 1)
            sheet1 = g.worksheet(i)
            sheet1.each do |row|

      #         判断单词是不是已录入
      #         @word = Word.find_by_content(row[1].to_s.strip)
      #         if @word
      #             #如果单词词性和意思都存在，不保存这个单词
      #             if @word.word_properties.to_a.include?getPt(row[3].to_s.strip) 
      #                 @word.update_attributes(:phonogram => row[2].to_s.strip)
      #             else
      #                 # 保存单词
      #                 # @word = Word.new(:content => row[1].to_s.strip, :phonogram => row[2].to_s.strip, :word_property_id => getPt(row[3].to_s.strip))
      #                 # @word.save
      #                 # 保存单词意思
      #                 row[4].to_s.strip.split("，").each do |m|
      #                     @meaning = Meaning.new(:content => m, :is_confirmed => 1)
      #                     @meaning.word = @word
      #                     @meaning.save
      #                 end
      #             end
      # #           ----end of if----
      #         else
                  # 保存单词
                  @word = Word.new(:content => row[1].to_s.strip, :phonogram => row[2].to_s.strip)
                  @word.save

                  # 保存单词意思
                  row[4].to_s.strip.split("，").each do |m|
                      @meaning = Meaning.new(:content => m, :is_confirmed => 1, :word_property_id => getPt(row[3].to_s.strip))
                      @meaning.word = @word
                      @meaning.save
                  end
              # end
    #         ----end of if----
            end
    #       ---- end sheet1 do ---
          end
    #     --- end of for
        end
    #   -------end of Spreadsheet-----
#      rescue
#         render  :file=>"#{Rails.root}/public/404.html", :status=>404, :layout=>false
#      end
  end
  #  -------end of store_data-----

end
  #  --------end of class----
