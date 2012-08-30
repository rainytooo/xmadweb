# encoding: utf-8
class ExamsController < ApplicationController
  before_filter :authorize_not_student!, :except => [:index, :show, :student, :todo_exam, :doing_exam, :done_exam, :corrected_exam]
  before_filter :authorize_activity!
  # GET /exams
  # GET /exams.json
  def index
    # 初始化试卷状态
    @student = User.find(params[:student_id])
    cur_time = DateTime.now().in_time_zone('Beijing')

    @done = Exam.where("user_id = ? and finish_time < ?", @student.id, "#{cur_time}").order("start_time desc").paginate(:page => params[:page], :per_page => 10)
    @done.each do |c|
      if c.status == 0
        @rp = ResultPaper.new(:paper_id => c.paper_id, :score => 0,:exam_id => c.id, :rate => "0.0",:user_id => @student.id)
        @rp.save
        PaperWord.transaction do
            inserts = []
            PaperWord.where(:paper_id => c.paper_id).each do |pw|
                inserts.push "(#{pw.word_id}, #{@rp.id}, '', 0, '#{cur_time}', '#{cur_time}')"
            end
            PaperWord.connection.execute "INSERT INTO result_words (word_id, result_paper_id, answer, is_right, created_at, updated_at) values #{inserts.join(", ")}"
        end
      end
      c.update_attributes(:status => 2)
    end

    @exams = @student.exams.order("start_time desc").paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @exams }
    end
  end

  # GET /exams/1
  # GET /exams/1.json
  def show
    @student = User.find(params[:student_id])
    @exam =  Exam.find(params[:id])
    @words = Word.joins(:paper_words).where(:paper_words =>{:paper_id => @exam.paper_id})
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @exam }
    end
  end

  # GET /exams/new
  # GET /exams/new.json
  def new
#    @student = User.find(params[:student_id])
    @exam = Exam.new
    @papers = Paper.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @exam }
    end
  end

  # GET /exams/1/edit
  def edit
    @exam = Exam.find(params[:id])
  end

  # POST /exams
  # POST /exams.json
  def create
    @user = User.find(params[:student_id])
    date1 = DateTime.strptime(params[:exam]['start_time'] + " CCT", "%Y-%m-%d %H:%M %Z")

    date2 = date1.advance(:minutes => params[:exam]['set_time'].to_i)
    params[:exam]['start_time'] = date1
    params[:exam]['finish_time'] = date2
    params[:exam]['status'] = 0

    @exam = Exam.new(params[:exam])
    @exam.user = @user
    
    respond_to do |format|
      if @exam.save
        format.html { redirect_to student_exams_path(@user), notice: 'Exam was successfully created.' }
        format.json { render json: @exam, status: :created, location: @exam }
      else
        format.html { render action: "new" }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /exams/1
  # PUT /exams/1.json
  def update
    @exam = Exam.find(params[:id])

    respond_to do |format|
      if @exam.update_attributes(params[:exam])
        format.html { redirect_to @exam, notice: 'Exam was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @exam.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exams/1
  # DELETE /exams/1.json
  def destroy
    @student = User.find(params[:student_id])
    @exam = @student.exams.find(params[:id])
    @rp = ResultPaper.find_by_exam_id(@exam.id)
    if @rp
        @rp.result_words.destroy
        @rp.destroy
    end
    @exam.destroy

    respond_to do |format|
      format.html { redirect_to student_exams_path(@student) }
      format.json { head :no_content }
    end
  end

  #  exams for student
  def student
  end

  # 考试分类列表
  def todo_exam
      cur_time = DateTime.now().in_time_zone('Beijing')
      @todo_exams = Exam.where("user_id = ? and start_time > ?", current_user.id, "#{cur_time}").order("start_time desc").paginate(:page => params[:page], :per_page => 10)
  end

  def doing_exam
      cur_time = DateTime.now().in_time_zone('Beijing')
      @doing = Exam.where("user_id = ? and start_time <= ? and finish_time >= ?", current_user.id, "#{cur_time}", "#{cur_time}").order("start_time desc").paginate(:page => params[:page], :per_page => 10)
      @doing.each do |exam|
        exam.update_attributes(:status => 1)
      end
      @doing_exams = Exam.where("user_id = ? and start_time <= ? and finish_time >= ?", current_user.id, "#{cur_time}", "#{cur_time}").order("start_time desc").paginate(:page => params[:page], :per_page => 10)
  end

  def done_exam
      cur_time = DateTime.now().in_time_zone('Beijing')
      @done = Exam.where("user_id = ? and finish_time < ?", current_user.id, "#{cur_time}").order("start_time desc").paginate(:page => params[:page], :per_page => 10)
      @done.each do |c|
        if c.status == 0
          @rp = ResultPaper.new(:paper_id => c.paper_id, :score => 0,:exam_id => c.id, :rate => "0.0",:user_id => current_user.id)
          @rp.save
          PaperWord.transaction do
              inserts = []
              PaperWord.where(:paper_id => c.paper_id).each do |pw|
                  inserts.push "(#{pw.word_id}, #{@rp.id}, '', 0, '#{cur_time}', '#{cur_time}')"
              end
              PaperWord.connection.execute "INSERT INTO result_words (word_id, result_paper_id, answer, is_right, created_at, updated_at) values #{inserts.join(", ")}"
          end
        end
        c.update_attributes(:status => 2)
      end
      @done_exams = Exam.where("user_id = ? and status = 2", current_user.id).order("start_time desc").paginate(:page => params[:page], :per_page => 10)
  end

  def corrected_exam
      cur_time = DateTime.now().in_time_zone('Beijing')
      @corrected_exams = Exam.where("user_id = ? and  status = 3", current_user.id).order("start_time desc").paginate(:page => params[:page], :per_page => 10)
  end

end
