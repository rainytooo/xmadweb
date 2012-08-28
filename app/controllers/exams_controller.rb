# encoding: utf-8
class ExamsController < ApplicationController
  before_filter :authorize_not_student!, :except => [:index, :show, :student, :todo_exam, :doing_exam, :done_exam, :corrected_exam]
  before_filter :authorize_activity!
  # GET /exams
  # GET /exams.json
  def index
    @student = User.find(params[:student_id])
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
      # check time
      time = Time.now.to_i
      @check = Exam.where("user_id=? and status in (0,1)",current_user.id)
      @check.each do |c|
          if time >= c.start_time.to_i && time <= c.finish_time.to_i
              if c.status == 0
                  c.update_attributes(:status => 1)
              end
          elsif time > c.finish_time.to_i
              @rp = ResultPaper.new(:paper_id => c.paper_id, :score => 0,:exam_id => c.id, :rate => "0.0",:user_id => current_user.id)
              @rp.save
              PaperWord.transaction do
                  inserts = []
                  PaperWord.where(:paper_id => c.paper_id).each do |pw|
                      t = Time.now
                      inserts.push "(#{pw.word_id}, #{@rp.id}, '', 0, '#{t}', '#{t}')"
                  end
                  PaperWord.connection.execute "INSERT INTO result_words (word_id, result_paper_id, answer, is_right, created_at, updated_at) values #{inserts.join(", ")}"
              end

              c.update_attributes(:status => 2)
          end
      end

      @todo_papers = Exam.where(:user_id => current_user.id, :status => 0).order("start_time desc").paginate(:page => params[:page], :per_page => 2)
      @doing_papers = Exam.where(:user_id => current_user.id, :status => 1).order("start_time desc").paginate(:page => params[:page], :per_page => 2)
      @done_papers = Exam.where(:user_id => current_user.id, :status => 2).order("start_time desc").paginate(:page => params[:page], :per_page => 2)
      @correct_papers = Exam.where(:user_id => current_user.id, :status => 3).order("start_time desc").paginate(:page => params[:page], :per_page => 2)
  end

  def todo_exam
      @todo_exams = Exam.where(:user_id => current_user.id, :status => 0).order("start_time desc").paginate(:page => params[:page], :per_page => 10)
  end

  def doing_exam
      @doing_exams = Exam.where(:user_id => current_user.id, :status => 1).order("start_time desc").paginate(:page => params[:page], :per_page => 10)
  end

  def done_exam
      @done_exams = Exam.where(:user_id => current_user.id, :status => 2).order("start_time desc").paginate(:page => params[:page], :per_page => 10)
  end

  def corrected_exam
      @corrected_exams = Exam.where(:user_id => current_user.id, :status => 3).order("start_time desc").paginate(:page => params[:page], :per_page => 10)
  end
end
