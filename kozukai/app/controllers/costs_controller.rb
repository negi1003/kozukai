# -*- coding: utf-8 -*-
class CostsController < ApplicationController
  def gruff_pie
    @time = Time.now.strftime("%Y%m%d%H%M%S")
    g = Gruff::Pie.new 500
=begin
    theme = {
      :colors => ["#000", "#111" , "#222", "#333", "#444", "#555"],
      :maker_color => "#999",
      :font_color => "#000",
      :background_colors => %w("#FFF" "#CCC")
    }
    g.theme = theme
=end
    #0を頂点にする。デフォルトだと右90度から始まる。
    g.zero_degree = -90
    #値をソートしない(デフォルトはtrue）
    g.sort = false

    g.title = "円グラフ"
    costs = Cost.find :all
    costs.each do |cost|
      g.data(cost.item.name, [cost.price])
    end
    g.font = Rails.root.to_s + "/public/font/HGRMB.TTC"
    g.write(Rails.root.to_s + "/public/gruff/#{@time}.jpg")
  end

  # GET /costs
  # GET /costs.xml
  def index
    term
    @costs = Cost.where('user_id = ? AND date BETWEEN ? AND ?', current_user.id, @first, @last)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @costs }
    end
  end

  # GET /costs/1
  # GET /costs/1.xml
  def show
    @cost = Cost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @cost }
    end

  end

  # GET /costs/new
  # GET /costs/new.xml
  def new
    @cost = Cost.new(:date => params[:date],
                     :user_id => current_user.id)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @cost }
    end
  end

  # GET /costs/1/edit
  def edit
    @cost = Cost.find(params[:id])
  end

  # POST /costs
  # POST /costs.xml
  def create
    @cost = Cost.new(params[:cost])
    respond_to do |format|
      if @cost.save
        format.html { redirect_to(@cost, :notice => 'Cost was successfully updated.') }
        format.xml  { render :xml => @cost, :status => :created, :location => @cost }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @cost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /costs/1
  # PUT /costs/1.xml
  def update
    @cost = Cost.find(params[:id])

    respond_to do |format|
      if @cost.update_attributes(params[:cost])
        format.html { redirect_to(@cost, :notice => 'Cost was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @cost.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /costs/1
  # DELETE /costs/1.xml
  def destroy
    @cost = Cost.find(params[:id])
    @cost.destroy

    respond_to do |format|
      format.html { redirect_to(:controller => "home") }
      format.xml  { head :ok }
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
