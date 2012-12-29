# encoding: utf-8
class TrafficMailer < ActionMailer::Base
  # default :from => "noreply@xiaoma.com"
  default :from => "goodboyryan007@gmail.com"

  @@arr = []
  def send_traffic(recipient)
    # # 先生成excel文件
    time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    @now = Time.now
    @@arr = []
    # traverse_dir("#{Rails.root}/download/triffs/")

    
    # if !@@arr.include?"#{@now.strftime('%Y-%m-%d')}-ReferralTraffic.xls"
    #     @triffs = ReferralTraffic.where('current_date' => time_range).order("clicks DESC")
    #     export_xls(@triffs, ReferralTraffic)
    # end
    # if !@@arr.include?"#{@now.strftime('%Y-%m-%d')}-OrganicTraffic.xls"
    #     @triff1s = OrganicTraffic.where('current_date' => time_range).order("clicks DESC")
    #     export_xls(@triff1s, OrganicTraffic)
    # end
    # if !@@arr.include?"#{@now.strftime('%Y-%m-%d')}-Campaign.xls"
    #     @all = Click.select("campaign, sum(clicks) as sum_campaign").group("campaign").where('record_date' => time_range).order("sum_campaign DESC")
    #     @count_all = Click.where('record_date' => time_range).sum("clicks")
    #     export_camp_xls(@all, @count_all, Campaign)
    # end


    @recipients = recipient
    @from = 'noreply@xiaoma.com'
    @subject = "流量数据统计表"
    
    attachments["引荐流量#{@now.strftime("%Y-%m-%d")}.xls"] = File.read("#{Rails.root}/download/triffs/#{@now.strftime('%Y-%m-%d')}-ReferralTraffic.xls")
    attachments["自然流量#{@now.strftime("%Y-%m-%d")}.xls"] = File.read("#{Rails.root}/download/triffs/#{@now.strftime('%Y-%m-%d')}-OrganicTraffic.xls")
    attachments["产品流量#{@now.strftime("%Y-%m-%d")}.xls"] = File.read("#{Rails.root}/download/triffs/#{@now.strftime('%Y-%m-%d')}-Campaign.xls")

    mail(:to => "#{recipient}", :subject => @subject)
  end

  # 查询目录下面的文件
  def traverse_dir(file_path)
      if File.directory? file_path
          Dir.foreach(file_path) do |file|
              if file !="." and file !=".."
                  traverse_dir(file_path+"/"+file)
              end
          end
      else
          @@arr << "#{File.basename(file_path)}"
      end
  end

  private  
    # 导出流量数据
    def export_xls(objs, model)
      count_row = 0
      count_col = 0
      xls_report = StringIO.new  
      book = Spreadsheet::Workbook.new
      sheet1 = book.create_worksheet :name => "traffics"  
        
      blue = Spreadsheet::Format.new :color => :blue, :weight => :bold, :size => 10  
      sheet1.row(0).default_format = blue  
      @cols = model.column_names

      @cols.each do |col| 
        if col == "clicks"
          sheet1[count_row, count_col] = "uv"
        else
          sheet1[count_row, count_col] = col
        end
        count_col = count_col + 1
      end

      sheet1[1, 2] = 122
      count_row = count_row + 2
      count_col = 0
      
      objs.each do |obj|
        @cols.each do |col| 
          sheet1[count_row,count_col]=obj["#{col}"]
          count_col = count_col + 1
        end
        count_col = 0 
        count_row = count_row + 1
      end  
      
      filepath=Rails.root+"download/triffs/#{Time.now.strftime('%Y-%m-%d')}-#{model}.xls" 
      book.write filepath
      xls_report.string
    end 

    # 导出流量数据
    def export_camp_xls(objs, count_all, model)
      count_row = 0
      count_col = 0
      xls_report = StringIO.new  
      book = Spreadsheet::Workbook.new
      sheet1 = book.create_worksheet :name => "traffics"  
        
      blue = Spreadsheet::Format.new :color => :blue, :weight => :bold, :size => 10  
      sheet1.row(0).default_format = blue  
      
      sheet1[0, 0] = '名称'
      sheet1[0, 1] = '点击量'


      sheet1[1, 1] = count_all
      count_row = count_row + 2
      puts "--------------#{objs.class}"
      
      objs.each do |obj|
        [0, 1].each do |col| 
          if col == 0
            sheet1[count_row,count_col]=Campaign.find(obj['campaign'].campaign).name
          else
            sheet1[count_row,count_col]=obj["sum_campaign"]
          end
        end
        count_row = count_row + 1
      end  
      
      filepath=Rails.root+"download/triffs/#{Time.now.strftime('%Y-%m-%d')}-#{model}.xls" 
      book.write filepath
      xls_report.string
    end 

end
