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
          when "a" then 3
          when "ad" then 4
          when "pron" then 5
          when "prep" then 6
          when "conj" then 7
          when "int" then 8
          when "num" then 9
          when "art" then 10
          when "abbr" then 11
          when "vt" then 12
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
                  # 保存单词
                  # prep./ad.在交通工具上,上船等  abbr.上午,午前
                  @word = Word.new(:content => row[0].to_s.strip, :phonogram => row[1].to_s.strip)
                  @word.save

                  # 保存单词意思
                  params = row[2].to_s.strip.delete("-")
                  # puts "#{params}"
                  # if 判断是不是存在“／”
                  if params.include?("/")
                      # 分割单词 取出意思和词性
                      if params.split("/").length == 2
                          # 分割第一次
                          property = params.split("/")
                          # 分割第二次
                          property1 = property[1].split(".")
                          
                          # 如果单词有多个意思
                          if property1[1].include?(",")

                              meanings = property1[1].split(",")
                              # 保存数据
                              meanings.each do |m|
                                @meaning = Meaning.new(:content => m, :is_confirmed => 1, :word_property_id => getPt(property[0].delete(".").to_s.strip))
                                @meaning.word = @word
                                @meaning.save
                              end

                              meanings.each do |m|
                                @meaning = Meaning.new(:content => m, :is_confirmed => 1, :word_property_id => getPt(property1[0].delete(".").to_s.strip))
                                @meaning.word = @word
                                @meaning.save
                              end
                          else
                              @meaning = Meaning.new(:content => property1[1], :is_confirmed => 1, :word_property_id => getPt(property[0].delete(".").to_s.strip))
                              @meaning.word = @word
                              @meaning.save
                              @meaning1 = Meaning.new(:content => property1[1], :is_confirmed => 1, :word_property_id => getPt(property[0].delete(".").to_s.strip))
                              @meaning1.word = @word
                              @meaning1.save
                          end
                      elsif params.split("/").length == 3
                          # 分割第一次
                          property = params.split("/")
                          # 分割第二次
                          property1 = property[2].split(".")
                          
                          # 如果一个单词的意思只有一个而且词性
                          if property1[1].include?(",")
                              meanings = property1[1].split(",")
                              # 保存数据
                              meanings[1].split(",").each do |m|
                                @meaning = Meaning.new(:content => m, :is_confirmed => 1, :word_property_id => getPt(property[0].delete(".").to_s.strip))
                                @meaning.word = @word
                                @meaning.save
                              end

                              meanings[1].split(",").each do |m|
                                @meaning = Meaning.new(:content => m, :is_confirmed => 1, :word_property_id => getPt(property[1].delete(".").to_s.strip))
                                @meaning.word = @word
                                @meaning.save
                              end

                              meanings[1].split(",").each do |m|
                                @meaning = Meaning.new(:content => m, :is_confirmed => 1, :word_property_id => getPt(property1[0].delete(".").to_s.strip))
                                @meaning.word = @word
                                @meaning.save
                              end
                          else
                              @meaning = Meaning.new(:content => property1[1], :is_confirmed => 1, :word_property_id => getPt(property[0].delete(".").to_s.strip))
                              @meaning.word = @word
                              @meaning.save
                              @meaning1 = Meaning.new(:content => property1[1], :is_confirmed => 1, :word_property_id => getPt(property[1].delete(".").to_s.strip))
                              @meaning1.word = @word
                              @meaning1.save
                              @meaning2 = Meaning.new(:content => property1[1], :is_confirmed => 1, :word_property_id => getPt(property1[0].delete(".").to_s.strip))
                              @meaning2.word = @word
                              @meaning2.save
                          end
                      end
                  # 不包含“／”
                  else
                    # 含有两个词性的情况
                    if params.split(".").length == 3
                      # 取得词性
                      properties = params.scan(/[a-z]+\./)
                      properties[0] = properties[0].delete(".")
                      properties[1] = properties[1].delete(".")
                      # 保存不是一个词性的单词而且不是在一起
                      meanings = params.split(/[a-z]\./)
                      # if meanings.include?(",")
                          meanings[1].split(",").each do |m|
                              @meaning = Meaning.new(:content => m, :is_confirmed => 1, :word_property_id => getPt(properties[0].to_s.strip))
                              @meaning.word = @word
                              @meaning.save
                          end 
                          meanings[2].split(",").each do |m|
                              @meaning = Meaning.new(:content => m, :is_confirmed => 1, :word_property_id => getPt(properties[1].to_s.strip))
                              @meaning.word = @word
                              @meaning.save
                          end
                    # 含有三个词性的情况
                    elsif  params.split(".").length == 4
                          # 取得词性
                          properties = params.scan(/[a-z]+\./)
                          properties[0] = properties[0].delete(".")
                          properties[1] = properties[1].delete(".")
                          properties[2] = properties[1].delete(".")
                          # 保存不是一个词性的单词而且不是在一起
                          meanings = params.split(/[a-z]\./)
                          # if meanings.include?(",")
                          meanings[1].split(",").each do |m|
                              @meaning = Meaning.new(:content => m, :is_confirmed => 1, :word_property_id => getPt(properties[0].to_s.strip))
                              @meaning.word = @word
                              @meaning.save
                          end 
                          meanings[2].split(",").each do |m|
                              @meaning = Meaning.new(:content => m, :is_confirmed => 1, :word_property_id => getPt(properties[1].to_s.strip))
                              @meaning.word = @word
                              @meaning.save
                          end
                          meanings[3].split(",").each do |m|
                              @meaning = Meaning.new(:content => m, :is_confirmed => 1, :word_property_id => getPt(properties[1].to_s.strip))
                              @meaning.word = @word
                              @meaning.save
                          end
                    else
                      property = params.split(".")
                      # puts "*******#{property[1]}"
                      meanings = property[1].split(",")
                      # puts "*******#{meanings}"
                      meanings.to_a.each do |m|
                          # puts "&&&&&&&#{m}"
                          @meaning = Meaning.new(:content => m, :is_confirmed => 1, :word_property_id => getPt(property[0].to_s.strip))
                          @meaning.word = @word
                          @meaning.save
                      end   
                    end                 
                  end

              # end
    #         ----end of if----
            end
            #---- end sheet1 do ---
          end
          #--- end of for
        end
        #-------end of Spreadsheet-----
#      rescue
#         render  :file=>"#{Rails.root}/public/404.html", :status=>404, :layout=>false
#      end
  end
  #  -------end of store_data-----

end
#--------end of class----
