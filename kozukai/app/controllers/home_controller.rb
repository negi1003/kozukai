class HomeController < ApplicationController
  def index
    term
    @costs = Cost.where('user_id = ? AND date BETWEEN ? AND ?', current_user.id, @first, @last)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @costs }
    end
  end

  def term
    today = Date.today
    cutoff_date = Setting.find_by_user_id(current_user.id).cutoff_date

    if today.day < cutoff_date
      date = today << 1
    else
      date = today
    end
    @year = params[:year] ? params[:year].to_i : date.year.to_i
    @month = params[:month] ? params[:month].to_i : date.month.to_i
    @day = Date.new(@year, @month, 1)


    if cutoff_date == 1
      @first = Date.civil(@year, @month, 1)
      @last = Date.civil(@year, @month, -1)
    else
      @first = Date.civil(@year, @month, cutoff_date)
      next_month = @first >> 1
      @last = Date.civil(next_month.year, next_month.month, cutoff_date - 1)
    end
  end
end
