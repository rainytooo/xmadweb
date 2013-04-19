# encoding: utf-8
class VocabularyExamsController < ApplicationController
    # 显示我的试卷
    # author: Ryan
    # 2013-04-18
    def my
      @words = VocabularyExam.where("user_id=?", current_user.id).order("created_at DESC").paginate(:page => params[:page], :per_page => 5);
    end
    # 保存单词考试
    # author: Ryan
    # 2013-04-17
    def save_voc
        VocabularyExam.save_answer(params[:user_id], params[:child_id], params[:voc]);
        redirect_to my_vocabulary_exams_url, notice: "恭喜您提交试卷成功！"
    end

    def index
        @vocabulary_exams = VocabularyExam.all

        respond_to do |format|
          format.html 
          format.json { render json: @vocabulary_exams }
        end
    end


    def show
    @vocabulary_exam = VocabularyExam.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vocabulary_exam }
    end
    end

    def new
    @vocabulary_exam = VocabularyExam.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vocabulary_exam }
    end
    end


    def edit
    @vocabulary_exam = VocabularyExam.find(params[:id])
    end

    def create
        @vocabulary_exam = VocabularyExam.new(params[:vocabulary_exam])

        respond_to do |format|
          if @vocabulary_exam.save
            format.html { redirect_to @vocabulary_exam, notice: 'Vocabulary exam was successfully created.' }
            format.json { render json: @vocabulary_exam, status: :created, location: @vocabulary_exam }
          else
            format.html { render action: "new" }
            format.json { render json: @vocabulary_exam.errors, status: :unprocessable_entity }
          end
        end
    end


    def update
    @vocabulary_exam = VocabularyExam.find(params[:id])

    respond_to do |format|
      if @vocabulary_exam.update_attributes(params[:vocabulary_exam])
        format.html { redirect_to @vocabulary_exam, notice: 'Vocabulary exam was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vocabulary_exam.errors, status: :unprocessable_entity }
      end
    end
    end


    def destroy
    @vocabulary_exam = VocabularyExam.find(params[:id])
    @vocabulary_exam.destroy

    respond_to do |format|
      format.html { redirect_to vocabulary_exams_url }
      format.json { head :no_content }
    end
    end
end
