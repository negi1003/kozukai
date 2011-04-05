class Cost < ActiveRecord::Base
  belongs_to :item

  validates :price,
            :presence => true,
            :numericality => { :greater_than_or_equal_to => 0,
                               :less_than_or_equal_to => 1000000 }

  validates :item_id,
            :presence => true

  validates :subject,
            :length => {:maximum => 25}

  validates :year,
            :presence => true


  validates :month,
            :presence => true

  validates :day,
            :presence => true

end
