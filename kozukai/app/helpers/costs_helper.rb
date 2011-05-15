module CostsHelper
  def cost_calendar(year, month)
    html = ""
 #   html += calendar(:year => @year, :month => @month)
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
