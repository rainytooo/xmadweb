class GoogleAnalyticsController < ApplicationController
  # GET /google_analytics
  # GET /google_analytics.json
  def index
    @google_analytics = GoogleAnalytic.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @google_analytics }
    end
  end

  # GET /google_analytics/1
  # GET /google_analytics/1.json
  def show
    @google_analytic = GoogleAnalytic.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @google_analytic }
    end
  end

  # GET /google_analytics/new
  # GET /google_analytics/new.json
  def new
    @google_analytic = GoogleAnalytic.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @google_analytic }
    end
  end

  # GET /google_analytics/1/edit
  def edit
    @google_analytic = GoogleAnalytic.find(params[:id])
  end

  # POST /google_analytics
  # POST /google_analytics.json
  def create
    @google_analytic = GoogleAnalytic.new(params[:google_analytic])

    respond_to do |format|
      if @google_analytic.save
        format.html { redirect_to @google_analytic, notice: 'Google analytic was successfully created.' }
        format.json { render json: @google_analytic, status: :created, location: @google_analytic }
      else
        format.html { render action: "new" }
        format.json { render json: @google_analytic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /google_analytics/1
  # PUT /google_analytics/1.json
  def update
    @google_analytic = GoogleAnalytic.find(params[:id])

    respond_to do |format|
      if @google_analytic.update_attributes(params[:google_analytic])
        format.html { redirect_to @google_analytic, notice: 'Google analytic was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @google_analytic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /google_analytics/1
  # DELETE /google_analytics/1.json
  def destroy
    @google_analytic = GoogleAnalytic.find(params[:id])
    @google_analytic.destroy

    respond_to do |format|
      format.html { redirect_to google_analytics_url }
      format.json { head :no_content }
    end
  end
end
