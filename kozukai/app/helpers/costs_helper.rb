module CostsHelper
  def cost_calendar(year, month)
    html = ""
    html += calendar(:year => @year, :month => @month)
    html
  end
end
