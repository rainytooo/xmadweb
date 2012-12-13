class TagCategoriesController < ApplicationController
  def index
    @tag_categories = TagCategory.order("created_at desc").paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tag_categories }
    end
  end

  # GET /tag_categories/1
  # GET /tag_categories/1.json
  def show
    @tag_category = TagCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tag_category }
    end
  end

    # 显示出流量详情
  def detail
    @category = TagCategory.find(params[:id])
    if params[:start_date].nil?
      time_range = (Time.now.midnight - 1.day)..Time.now.midnight
    else
      @t = DateTime.strptime(params[:start_date] + " CCT", "%Y-%m-%d")
      time_range = (@t.midnight - 1.day + 1.second)..@t.midnight
    end
    @cat_id = params[:id]
    print "--------------#{[1,2].include?@cat_id }"
    if ['1','2'].include?@cat_id
      @clicks = Click.where('record_date' => time_range).where("category = #{params[:id]}").paginate(:page => params[:page], :per_page => 10)
      @total = Click.where('record_date' => time_range).where("category = #{params[:id]}").sum("clicks")
    else
      @clicks = Click.where('record_date' => time_range).where("up_category = #{params[:id]}").paginate(:page => params[:page], :per_page => 10)
      @total = Click.where('record_date' => time_range).where("up_category = #{params[:id]}").sum("clicks")
    end
  end

  # GET /tag_categories/new
  # GET /tag_categories/new.json
  def new
    @tag_category = TagCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tag_category }
    end
  end

  # GET /tag_categories/1/edit
  def edit
    @tag_category = TagCategory.find(params[:id])
  end

  # POST /tag_categories
  # POST /tag_categories.json
  def create
    @tag_category = TagCategory.new(params[:tag_category])

    respond_to do |format|
      if @tag_category.save
        format.html { redirect_to @tag_category, notice: 'Tag category was successfully created.' }
        format.json { render json: @tag_category, status: :created, location: @tag_category }
      else
        format.html { render action: "new" }
        format.json { render json: @tag_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tag_categories/1
  # PUT /tag_categories/1.json
  def update
    @tag_category = TagCategory.find(params[:id])

    respond_to do |format|
      if @tag_category.update_attributes(params[:tag_category])
        format.html { redirect_to @tag_category, notice: 'Tag category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tag_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tag_categories/1
  # DELETE /tag_categories/1.json
  def destroy
    @tag_category = TagCategory.find(params[:id])
    @tag_category.destroy

    respond_to do |format|
      format.html { redirect_to tag_categories_url }
      format.json { head :no_content }
    end
  end
end
