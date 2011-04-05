# -*- coding: utf-8 -*-
module ApplicationHelper
  def wday(date)
    int = date.strftime("%w")
    int = int.to_i
    case int
    when 6
      style = "color:blue"
    when 0
      style = "color:red"
    else
      style = nil
    end
    wday = "#{date.day}(#{change_wday(int)})"
    wday = label_tag("wday", wday, {:style => style})
    
  end

  def change_wday(wday)
    case wday
    when 0
      return "日"
    when 1
      return "月"
    when 2
      return "火"
    when 3
      return "水"
    when 4
      return "木"
    when 5
      return "金"
    when 6
      return "土"
    end
  end

end
