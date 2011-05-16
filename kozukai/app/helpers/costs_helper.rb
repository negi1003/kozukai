# -*- coding: utf-8 -*-
module CostsHelper
  def term
    cutoff_date = Setting.find_by_user_id(current_user.id).cutoff_date
    if cutoff_date == 1
      first = Date.civil(@year, @month, 1)
      last = Date.civil(@year, @month, -1)
    else
      first = Date.civil(@year, @month, cutoff_date)
      next_month = first >> 1
      last = Date.civil(next_month.year, next_month.month, cutoff_date - 1)
    end
    html = "#{first.year}/#{first.month}/#{first.day}"
    html += "〜"
    html += "#{last.year}/#{last.month}/#{last.day}"
    html
  end

  def cost_calendar(year, month)
    html = ""
    html += calendar(:year => year, :month => month) do |d|
              [d.mday, {:class => calender_class(d)}]
            end

    html
  end

  def calender_class(d)
    date = d.to_date
    int = date.strftime("%w")
    int = int.to_i
    p "#{date} #{int}"
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
