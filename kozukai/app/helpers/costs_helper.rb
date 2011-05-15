module CostsHelper
  def cost_calendar(year, month)
    html = ""
 #   html += calendar(:year => @year, :month => @month)
    html += calendar(:year => @year, :month => @month) do |d|
              [d.mday, {:class => "specialDay"}]
            end

    html
  end
end
