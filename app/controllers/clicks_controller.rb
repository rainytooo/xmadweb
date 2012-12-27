# encoding: utf-8
class ClicksController < ApplicationController
  before_filter :authorize_not_student!
  before_filter :authorize_activity!
  before_filter :authorize_super_admin!
  
  # 以页面为中心
  def index
    time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    @clicks = Click.where('record_date' => time_range).paginate(:page => params[:page], :per_page => 20).group("page")
    @click_count = Click.where('record_date' => time_range).sum(:clicks)
    @pages = Click.where('record_date' => time_range)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @clicks }
    end
  end

  # 以广告系列为中心
  def index_campaign
    time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    @clicks = Click.where('record_date' => time_range).paginate(:page => params[:page], :per_page => 20).group("campaign")
    @click_count = Click.where('record_date' => time_range).sum(:clicks)
    @cams = Click.where('record_date' => time_range)
    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # 查询出所有的活动点击量
  def sum_campaign
    if params[:start_date] && params[:end_date]
      if params[:start_date].strip.empty? && params[:end_date].strip.empty?
        time_range = (Time.now.midnight - 1.day)..Time.now.midnight
      else
        @t = DateTime.strptime(params[:start_date] + " CCT", "%Y-%m-%d")
        @t1 = DateTime.strptime(params[:end_date] + " CCT", "%Y-%m-%d")
        @time = @t.strftime("%Y-%m-%d")
        @time1 = @t1.strftime("%Y-%m-%d")
        time_range = @time..@time1
        # @all = "select a.*, b.* From (SELECT *, sum(clicks) as sum_campaign FROM `clicks` GROUP BY campaign) a JOIN `campaigns` b ON a.campaign = b.id;";
      end
    else
      time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    end
    @all = Click.where('record_date' => time_range).select("*, sum(clicks) as sum_campaign").group("campaign").order("sum_campaign DESC")
  end

  # 查询出所有位置点击量
  def sum_position
    if params[:start_date] && params[:end_date]
      if params[:start_date].strip.empty? && params[:end_date].strip.empty?
        time_range = (Time.now.midnight - 1.day)..Time.now.midnight
      else
        @t = DateTime.strptime(params[:start_date] + " CCT", "%Y-%m-%d")
        @t1 = DateTime.strptime(params[:end_date] + " CCT", "%Y-%m-%d")
        @time = @t.strftime("%Y-%m-%d")
        @time1 = @t1.strftime("%Y-%m-%d")
        time_range = @time..@time1
      end
    else
      time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    end
    @all = Click.where('record_date' => time_range).select("*, sum(clicks) as sum_position").group("position").order("sum_position DESC")
  end

  # 查询出所有的页面击量
  def sum_page
    if params[:start_date] && params[:end_date]
      if params[:start_date].strip.empty? && params[:end_date].strip.empty?
        time_range = (Time.now.midnight - 1.day)..Time.now.midnight
      else
        @t = DateTime.strptime(params[:start_date] + " CCT", "%Y-%m-%d")
        @t1 = DateTime.strptime(params[:end_date] + " CCT", "%Y-%m-%d")
        @time = @t.strftime("%Y-%m-%d")
        @time1 = @t1.strftime("%Y-%m-%d")
        time_range = @time..@time1
      end
    else
      time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    end
    @all = Click.where('record_date' => time_range).select("*, sum(clicks) as sum_page").group("page").order("sum_page DESC")
  end

  # 查询出所有的类别点击量
  def sum_category
    if params[:start_date] && params[:end_date]
      if params[:start_date].strip.empty? && params[:end_date].strip.empty?
        time_range = (Time.now.midnight - 1.day)..Time.now.midnight
      else
        @t = DateTime.strptime(params[:start_date] + " CCT", "%Y-%m-%d")
        @t1 = DateTime.strptime(params[:end_date] + " CCT", "%Y-%m-%d")
        @time = @t.strftime("%Y-%m-%d")
        @time1 = @t1.strftime("%Y-%m-%d")
        time_range = @time..@time1
      end
    else
      time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    end
    @all = Click.where('record_date' => time_range).select("*, sum(clicks) as sum_category").group("category").order("sum_category DESC")
  end

  # 查询出所有的子类别点击量
  def sum_child_category
    if params[:start_date] && params[:end_date]
      if params[:start_date].strip.empty? && params[:end_date].strip.empty?
        time_range = (Time.now.midnight - 1.day)..Time.now.midnight
      else
        @t = DateTime.strptime(params[:start_date] + " CCT", "%Y-%m-%d")
        @t1 = DateTime.strptime(params[:end_date] + " CCT", "%Y-%m-%d")
        @time = @t.strftime("%Y-%m-%d")
        @time1 = @t1.strftime("%Y-%m-%d")
        time_range = @time..@time1
      end
    else
      time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    end
    @all = Click.where('record_date' => time_range).select("*, sum(clicks) as sum_category").group("up_category").order("sum_category DESC")
  end

  # 查询出所在时间短的总流量
  def search_result
    conditions = " 1=1"
    if !params[:web_page].empty?
      @web_page = params[:web_page]
      conditions << " and `page` = #{@web_page}"
    end

    if !params[:position].empty?
      @position = params[:position]
      conditions << " and position = #{@position}"
    end

    if !params[:campaign].empty?
      @campaign = params[:campaign]
      conditions << " and campaign = #{@campaign}"
    end

    if !params[:category].empty?
      @category = params[:category]
      conditions << " and up_category = #{@category}"
    end

    if !params[:start_date].empty?
      @t = DateTime.strptime(params[:start_date] + " CCT", "%Y-%m-%d")
      @time = @t.strftime("%Y-%m-%d")
      time_range = ((@t.midnight + 1.second) - 1.day)..@t.midnight
      @clicks = Click.where('record_date' => time_range).where(conditions).paginate(:page => params[:page], :per_page => 20).group("`page`")#.order("clicks DESC")
      @pages = Click.where('record_date' => time_range).where(conditions)
      @click_count = Click.where('record_date' => time_range).where(conditions).sum(:clicks)
    else
      @clicks = Click.where(conditions).paginate(:page => params[:page], :per_page => 20).group("`page`") #.order("clicks DESC")
      @pages = Click.where(conditions)
      @click_count = Click.where(conditions).sum(:clicks)
    end

    # if !params[:start_date].empty?
    #   @t = DateTime.strptime(params[:start_date] + " CCT", "%Y-%m-%d")
    #   @time = @t.strftime("%Y-%m-%d")
    #   time_range = ((@t.midnight + 1.second) - 1.day)..@t.midnight
    #   @clicks = Click.where('record_date' => time_range).where(conditions).paginate(:page => params[:page], :per_page => 20).group("`campaign`")#.order("clicks DESC")
    #   @cams = Click.where('record_date' => time_range).where(conditions)
    #   @click_count = Click.where('record_date' => time_range).where(conditions).sum(:clicks)
    # else
    #   @clicks = Click.where(conditions).paginate(:page => params[:page], :per_page => 20).group("`campaign`") #.order("clicks DESC")
    #   @cams = Click.where(conditions)
    #   @click_count = Click.where(conditions).sum(:clicks)
    # end

  end

  # 如果没有显示内容可以允许添加内容
  def add_campaign
    @click = params[:id]
    @campaigns = Campaign.paginate(:page => params[:page], :per_page => 20)
  end

  def save_campaign
    @click = Click.find(params[:click_id])
    @click.update_attributes(:campaign => params[:campaign])
    respond_to do |format|
      format.html { redirect_to clicks_url, notice: "添加成功！"}
    end
  end  

  # 如果没有显示位置可以允许添加内容
  def add_position
    @click = params[:id]
    @positions = Position.paginate(:page => params[:page], :per_page => 20)
  end

  def save_position 
    @click = Click.find(params[:click_id])
    @click.update_attributes(:position => params[:position])
    respond_to do |format|
      format.html { redirect_to clicks_url, notice: "添加成功！"}
    end
  end
  # 如果没有页面可以允许添加内容
  def add_page
    @click = params[:id]
    @pages = WebPage.paginate(:page => params[:page], :per_page => 20)
  end

  def save_page
    @click = Click.find(params[:click_id])
    @click.update_attributes(:page => params[:page])
    respond_to do |format|
      format.html { redirect_to clicks_url, notice: "添加成功！"}
    end
  end
  # 如果没有分类可以允许添加内容
  def add_category
    @click = params[:id]
    @categories = TagCategory.where("id != uid").paginate(:page => params[:page], :per_page => 20)
  end

  def save_category
    @click = Click.find(params[:click_id])
    @click.update_attributes(:category => params[:categroy_id])
    respond_to do |format|
      format.html { redirect_to clicks_url, notice: "添加成功！"}
    end
  end

  # 如果没有分类可以允许添加内容
  def add_up_category
    @click = params[:id]
    @categories = TagCategory.paginate(:page => params[:page], :per_page => 20)
  end

  def save_up_category
    @click = Click.find(params[:click_id])
    @click.update_attributes(:up_category => params[:up_categroy_id])
    respond_to do |format|
      format.html { redirect_to clicks_url, notice: "添加成功！"}
    end
  end

  def show
    @click = Click.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @click }
    end
  end

  def new
    @click = Click.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @click }
    end
  end

  def edit
    @click = Click.find(params[:id])
  end

  def create
    params[:click]['up_category'] =  TagCategory.find(params[:click]['category']).uid
    @click = Click.new(params[:click])

    respond_to do |format|
      if @click.save
        format.html { redirect_to @click, notice: 'Click was successfully created.' }
        format.json { render json: @click, status: :created, location: @click }
      else
        format.html { render action: "new" }
        format.json { render json: @click.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @click = Click.find(params[:id])

    respond_to do |format|
      if @click.update_attributes(params[:click])
        format.html { redirect_to @click, notice: 'Click was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @click.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @click = Click.find(params[:id])
    @click.destroy

    respond_to do |format|
      format.html { redirect_to clicks_url }
    end
  end

  # bbs 核心用户
  def core_customer
    time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    @customers = CoreBbsCustomer.where('current_date' => time_range).paginate(:page => params[:page], :per_page => 20)
    
    respond_to do |format|
      format.html
    end
  end

  # refferal访问来源
  def refferal_traffic
    time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    @triffs = FrontTraffic.where('current_date' => time_range).order("clicks DESC")
    
    respond_to do |format|
      format.html
    end
  end

  # organic访问来源
  def organic_traffic
    time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    @triffs = OrganicTraffic.where('current_date' => time_range).order("clicks DESC").paginate(:page => params[:page], :per_page => 50)
    
    respond_to do |format|
      format.html
    end
  end

end
