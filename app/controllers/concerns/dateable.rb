module Dateable
  def parse_date
    [Date.today.strftime("%Y-%-m-%d"), 7.days.ago.strftime("%Y-%-m-%d")]
  end
end
