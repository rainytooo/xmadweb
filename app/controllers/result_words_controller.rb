class ResultWordsController < ApplicationController
  before_filter :authorize_activity!
  # GET /result_words
  # GET /result_words.json
  def index
    @student = User.find(params[:student_id])
    @result_paper = ResultPaper.find(params[:result_paper_id])
    @result_words = @result_paper.result_words.paginate(:page => params[:page], :per_page => 20)

#    @meanings = Meanings.find_by_sql("select ms.content from meanings ms,result_words rw where ms.word_id=rw.word_id group by rw.word_id having rw.result_paper_id=#{params[:result_paper_id]}#")
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @result_words }
    end
  end

  # GET /result_words/1
  # GET /result_words/1.json
  def show
    @result_paper = ResultPaper.find(params[:result_paper_id])
    @result_word = @result_paper.result_words.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @result_word }
    end
  end

  # GET /result_words/new
  # GET /result_words/new.json
  def new
    @result_word = ResultWord.new
    @exam = Exam.find(params[:exam_id])
    @paper_words = PaperWord.find_all_by_paper_id(@exam.paper_id)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @result_word }
    end
  end

  # GET /result_words/1/edit
  def edit
    @result_word = ResultWord.find(params[:id])
  end

  # POST /result_words
  # POST /result_words.json
  def create
    # receive datas
    word_id = params[:word_id]
    answer = params[:answer]
    @exam = Exam.find(params[:exam_id])

    #create a result_paper
    @rpaper = ResultPaper.new(:exam_id => @exam.id, :paper_id => @exam.paper_id, :user_id => current_user.id)
    @rpaper.save

    # index is for array index
    # each student only can answer once,never more(if only recreate the task)
    index = 0
    word_id.each do |f|
      is_right = 2
      Word.find(word_id[index]).meanings.each do |f|
         if f.content.to_s.strip == answer[index].to_s.strip
              is_right = 1
              break
         elsif f.content.to_s.strip.empty?
              is_right = 0
         end
      end

      @answer = ResultWord.new(:is_right => is_right,:word_id => word_id[index], :answer => answer[index],:result_paper_id  => @rpaper.id)
      @answer.save
      
      index = index + 1
    end
    #generate the score
    all = ResultWord.where(:result_paper_id => @rpaper.id).count*1.00
    score = ResultWord.where(:is_right => 1,:result_paper_id => @rpaper.id).count

    @result_paper = ResultPaper.find(@rpaper.id)
    @result_paper.update_attributes(:score => score, :rate => (score/all)*100)
    @exam.update_attributes(:status => 2)

    respond_to do |format|
       format.html { redirect_to root_url, notice: 'submit successfully created.' }
    end
    
  end

  # PUT /result_words/1
  # PUT /result_words/1.json
  def update
    @result_word = ResultWord.find(params[:id])

    respond_to do |format|
      if @result_word.update_attributes(params[:result_word])
        format.html { redirect_to @result_word, notice: 'Result word was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @result_word.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /result_words/1
  # DELETE /result_words/1.json
  def destroy
    @result_word = ResultWord.find(params[:id])
    @result_word.destroy

    respond_to do |format|
      format.html { redirect_to result_words_url }
      format.json { head :no_content }
    end
  end
  
end
