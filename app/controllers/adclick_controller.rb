# encoding: utf-8
class AdclickController < ApplicationController
  def index
    # 查询昨天的点击情况
    @date_1 = params[:date]
    @clicks = Click.joins('left outer join advertisements on advertisements.tagname = clicks.tagname ')
      .where("clicks.record_date = ?", params[:date])
      .select('advertisements.*, clicks.*').order('clicks.clicks desc')
  end
end
