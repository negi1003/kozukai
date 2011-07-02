# -*- coding: utf-8 -*-
module CostsCalenderUtil
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
              cell_attrs = {:class => calender_class(d)}
              #cell_attrs[:onclick] = "location.href = './costs/new';" 
              cell_attrs[:href] = "/costs/new?date=" + d.to_s
              cell_attrs[:rel] = "prettyPopin" 
              @costs.each do |cost|
                if d == cost.date
                  cell_text << "<div>"
                  cell_text << link_to("#{cost.item.name}:#{cost.price}",
                 { :controller => "costs",
                   :action => "edit",
                   :id => cost},
                  { :rel => "prettyPopin" })
                  cell_text << "</div>"
                end
              end
              [cell_text, cell_attrs]
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
