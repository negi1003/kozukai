# -*- coding: utf-8 -*-
module CostsHelper
  def term
    html = "#{@first.year}/#{@first.month}/#{@first.day}"
    html += "〜"
    html += "#{@last.year}/#{@last.month}/#{@last.day}"
    html
  end

  def cost_calendar(year, month)
    html = ""
    html += calendar(:year => year, :month => month) do |d|
              cell_text = d.mday.to_s
              @costs.each do |cost|
                if d == cost.date
                  cell_text << link_to("#{cost.item.name}:#{cost.price}",
                  :controller => "costs", :action => "edit", :id => cost)
                end
              end
              [cell_text, {:class => calender_class(d)}]
            end

    html
  end

  def calender_class(d)
    date = d.to_date
    int = date.strftime("%w")
    int = int.to_i
    case int
    when 6
      class_name = "saturDay"
    when 0
      class_name = "sunDay"
    else
      class_name = "day"
    end
    return class_name
  end
end
