class PapersController < ApplicationController
  before_filter :authorize_not_student!
  before_filter :authorize_activity!
  # GET /papers
  # GET /papers.json
  def index
    @papers = Paper.paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @papers }
    end
  end

  # GET /papers/1
  # GET /papers/1.json
  def show
    @paper = Paper.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @paper }
    end
  end

  # GET /papers/new
  # GET /papers/new.json
  def new
    @paper = Paper.new
    @total_word = Word.all.count
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @paper }
    end
  end

  # GET /papers/1/edit
  def edit
    @paper = Paper.find(params[:id])
  end

  # POST /papers
  # POST /papers.json
  def create
    start_word = params[:paper]["start_word"]
    end_word = params[:paper]["end_word"]
    is_before = params[:paper]["is_before"].to_i  

    @paper = Paper.new(params[:paper])
    @paper.save

    word_ids = []
    for i in start_word..end_word do
        word_ids << i
    end
    # 数据存入 试卷表
    # 如果是课前测顺序生成试卷
    if  is_before == 0
        PaperWord.transaction do
            inserts = []
            word_ids.each do |i|
                t = Time.now
                inserts.push "(#{i}, #{@paper.id}, '#{t}', '#{t}')"
            end
            PaperWord.connection.execute "INSERT INTO paper_words (word_id, paper_id, created_at, updated_at) values #{inserts.join(", ")}"
        end
    # 如果是课后测随机序号生成试卷
    elsif  is_before == 1
        word_ids = word_ids.sort_by{ rand }
        PaperWord.transaction do
            inserts = []
            word_ids.each do |i|
                t = Time.now
                inserts.push "(#{i}, #{@paper.id},'#{t}','#{t}')"
            end
            PaperWord.connection.execute "INSERT INTO paper_words (word_id, paper_id, created_at, updated_at) values #{inserts.join(", ")}"
        end
    end

    respond_to do |format|
      if @paper.save
        format.html { redirect_to @paper, notice: 'Paper was successfully created.' }
        format.json { render json: @paper, status: :created, location: @paper }
      else
        format.html { render action: "new" }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
    
  end

  
  # PUT /papers/1
  # PUT /papers/1.json
  def update
    @paper = Paper.find(params[:id])

    respond_to do |format|
      if @paper.update_attributes(params[:paper])
        format.html { redirect_to @paper, notice: 'Paper was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /papers/1
  # DELETE /papers/1.json
  def destroy
    @paper = Paper.find(params[:id])
    @paper.destroy

    respond_to do |format|
      format.html { redirect_to papers_url }
      format.json { head :no_content }
    end
  end
end
