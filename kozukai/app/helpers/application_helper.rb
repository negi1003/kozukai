# -*- coding: utf-8 -*-

include CalendarHelper

module ApplicationHelper
  def wday(date)
    style = week_day_style(date)
    wday = "#{date.day}(#{change_wday(date)})"
    wday = label_tag("wday", wday, {:style => style})
    
  end

  def week_day_style(date)
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
    return style
  end

  def change_wday(date)
    int = date.strftime("%w")
    int = int.to_i

    case int
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
