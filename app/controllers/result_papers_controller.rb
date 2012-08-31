class ResultPapersController < ApplicationController
#  before_filter :authorize_not_student!, :except => [:new, :create]
#  before_filter :authorize_activity!
  # GET /result_papers
  # GET /result_papers.json
  def index
    @student = User.find(params[:student_id])
    @result_papers = @student.result_papers.order("created_at desc").paginate(:page => params[:page], :per_page => 10)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @result_papers }
    end
  end

  # GET /result_papers/1
  # GET /result_papers/1.json
  def show
      @student = User.find(params[:student_id])
      @result_paper = ResultPaper.find(params[:id])
      exam =  Exam.find(@result_paper.exam_id)
      @words = Word.joins(:paper_words).where(:paper_words =>{:paper_id => exam.paper_id})

      respond_to do |format|
        format.html # show.html.erb
      end
  end

  # GET /result_papers/new
  # GET /result_papers/new.json
  def new
    @student = User.find(params[:student_id])
    @result_paper = @student.result_papers.new
    @exam =  Exam.find(params[:id])
    @words = Word.joins(:paper_words).where(:paper_words => {:paper_id => @exam.paper_id})

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @result_paper }
    end
  end

  # GET /result_papers/1/edit
  def edit
    @student = User.find(params[:student_id])
    @result_paper = ResultPaper.find(params[:id])
  end

  # POST /result_papers
  # POST /result_papers.json
  def create
      word_id = params[:word_id]
      answer = params[:answer]
      @exam = Exam.find(params[:exam_id])

      @rpaper = ResultPaper.new(:exam_id => @exam.id, :paper_id => @exam.paper_id, :user_id => current_user.id)
      @rpaper.save

      # index is for array
      is_right = []
      word_id.size.times do |index|
          if !answer[index].to_s.strip.empty?
              rights = []
              Meaning.where("word_id = #{word_id[index]}").find_each do  |r|
                  rights << r.content
              end
              if rights.include?(answer[index].to_s.strip)
                  is_right << 1
              else
                  is_right << 2
              end
              rights = []
          else
              is_right << 0
          end
      end

      ResultWord.transaction do
          inserts = []
          word_id.size.times do |i|
              inserts.push "(#{is_right[i]}, #{word_id[i]}, '#{(answer[i].empty?)?"":answer[i]}', #{@rpaper.id})"
          end
          ResultWord.connection.execute "INSERT INTO result_words (is_right, word_id, answer, result_paper_id) values #{inserts.join(", ")}"
      end

      #generate the score
      all = ResultWord.where(:result_paper_id => @rpaper.id).count*1.00
      score = ResultWord.where(:is_right => 1,:result_paper_id => @rpaper.id).count

      @result_paper = ResultPaper.find(@rpaper.id)
      @result_paper.update_attributes(:score => score, :rate => (score/all)*100)
      @exam.update_attributes(:status => 2)

      respond_to do |format|
          format.html { redirect_to student_student_exams_path(params[:student_id]), notice: 'Result paper was successfully created.' }
      end
  
  end

  # spm correct papers
  def update
    @result_paper = ResultPaper.find(params[:id])
    result_paper_id = params[:id]
    @exam = Exam.find(@result_paper.exam_id)
    @student = User.find(params[:student_id])


    # receive datas
    add_new_meaning = params[:add_new_meaning]

    ResultWord.find_in_batches(:conditions => "is_right = 2 and result_paper_id = #{result_paper_id}") do |rp|
        is_right = "is_right"
        rp.each do |r|
            if r.word_id
                is_right << r.word_id.to_s
                is_right = params[:"#{is_right}"]
            else
                is_right = 0
            end
            r.update_attributes(:is_right =>  is_right)
            is_right = "is_right"
        end
    end
    # add  new meanings to the word
    if add_new_meaning != nil
        add_new_meaning.each do |word_id|
            @meaning = Meaning.new(:is_confirmed => 0, :word_id => word_id)
            @meaning.content = ResultWord.find_by_word_id(word_id).answer
            @meaning.save
        end
    end

    # regenerate the score
    all = ResultWord.where(:result_paper_id => result_paper_id).count*1.00
    score = ResultWord.where(:is_right => 1,:result_paper_id => result_paper_id).count

    @result_paper.update_attributes(:score => score, :rate => (score/all)*100)
    @exam.update_attributes(:status => 3)
    
    respond_to do |format|
        format.html { redirect_to student_result_papers_path(@student), :notice => "Correct by hand already!"}
    end
  end

  # DELETE /result_papers/1
  # DELETE /result_papers/1.json
  def destroy
    @student = User.find(params[:student_id])
    @result_paper = @student.result_papers.find(params[:id])
    @result_paper.destroy

    respond_to do |format|
      format.html { redirect_to student_result_papers_path(@student) }
      format.json { head :no_content }
    end
  end

  # show students score list
  def student
    @result_papers = ResultPaper.where(:user_id => params[:id])
    @user = User.find(@result_papers.first.user_id)
  end
  
end
