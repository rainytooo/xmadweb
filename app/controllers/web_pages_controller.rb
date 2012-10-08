class WebPagesController < ApplicationController
  # GET /web_pages
  # GET /web_pages.json
  def index
    @web_pages = WebPage.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @web_pages }
    end
  end

  # GET /web_pages/1
  # GET /web_pages/1.json
  def show
    @web_page = WebPage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @web_page }
    end
  end

  # 显示出流量详情
  def detail
    @page = WebPage.find(params[:id])
    if params[:start_date].nil?
      time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    else
      @t = DateTime.strptime(params[:start_date] + " CCT", "%Y-%m-%d")
      time_range = (@t.midnight - 1.day + 1.second)..@t.midnight
    end
    @clicks = Click.where('record_date' => time_range).where("page = #{params[:id]}").paginate(:page => params[:page], :per_page => 10)
    @total = Click.where('record_date' => time_range).where("page = #{params[:id]}").sum("clicks")
  end

  # GET /web_pages/new
  # GET /web_pages/new.json
  def new
    @web_page = WebPage.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @web_page }
    end
  end

  # GET /web_pages/1/edit
  def edit
    @web_page = WebPage.find(params[:id])
  end

  # POST /web_pages
  # POST /web_pages.json
  def create
    @web_page = WebPage.new(params[:web_page])

    respond_to do |format|
      if @web_page.save
        format.html { redirect_to @web_page, notice: 'Web page was successfully created.' }
        format.json { render json: @web_page, status: :created, location: @web_page }
      else
        format.html { render action: "new" }
        format.json { render json: @web_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /web_pages/1
  # PUT /web_pages/1.json
  def update
    @web_page = WebPage.find(params[:id])

    respond_to do |format|
      if @web_page.update_attributes(params[:web_page])
        format.html { redirect_to @web_page, notice: 'Web page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @web_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /web_pages/1
  # DELETE /web_pages/1.json
  def destroy
    @web_page = WebPage.find(params[:id])
    @web_page.destroy

    respond_to do |format|
      format.html { redirect_to web_pages_url }
      format.json { head :no_content }
    end
  end
end
