# encoding: utf-8
class ResultsController < ApplicationController 
  before_filter :authorize_not_student!
  before_filter :authorize_activity!
  before_filter :find_student, :except => [:all_by_day]
  # GET /results
  # GET /results.json
  def index
    @results = Result.where(:student_id => @student.id)
      .order('result_date desc')
      .paginate(:page => params[:page], :per_page => 20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @results }
    end
  end

  # GET /results/1
  # GET /results/1.json
  def show
    @result = Result.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @result }
    end
  end

  # GET /results/new
  # GET /results/new.json
  def new
    @result = Result.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @result }
    end
  end

  # GET /results/1/edit
  def edit
    @result = Result.find(params[:id])
  end

  # POST /results
  # POST /results.json
  def create
    @result = Result.new(params[:result])
    date1 = params[:result][:result_date].to_datetime.change(:hour => 1)
    @result.result_date = date1
    @result.student = @student
    @result.jpm = current_user
    respond_to do |format|
      if @result.save
        format.html { redirect_to student_results_path(@student), notice: 'Result was successfully created.' }
        format.json { render json: student_results_path(@student), status: :created, location: @result }
      else
        format.html { render action: "new" }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /results/1
  # PUT /results/1.json
  def update
    @result = Result.find(params[:id])
    @result.student = @student
    @result.jpm = current_user
    date1 = params[:result][:result_date].to_datetime.change(:hour => 1)
    params[:result][:result_date] = date1
    respond_to do |format|
      if @result.update_attributes(params[:result])
        format.html { redirect_to student_results_path(@student), notice: 'Result was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result = Result.find(params[:id])
    @result.destroy

    respond_to do |format|
      format.html { redirect_to student_results_path(@student) }
      format.json { head :no_content }
    end
  end
  # 查询成绩 按日期
  def all_by_day
    #date_org = params[:result_date].to_datetime
    date_org = DateTime.strptime(params[:result_date] + " CCT", "%Y-%m-%d %Z")
    date1 = date_org.change(:hour => 0, :min => 0, :sec => 0)
    date2 = date_org.change(:hour => 23, :min => 59, :sec => 59)
    @results = Result.joins('LEFT OUTER JOIN Users ON Users.id = student_id')
      .where(:result_date => date1.to_time..date2.to_time, 'Users.is_activity' => true)
  end
  
  private

  def find_student
    @student = User.find(params[:student_id])
  end
end
