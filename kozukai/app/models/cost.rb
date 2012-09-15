class Cost < ActiveRecord::Base
  belongs_to :item

  attr_accessible :price, :subject, :date, :user_id, :item_id

  validates :price,
            :presence => true,
            :numericality => { :greater_than_or_equal_to => 0,
                               :less_than_or_equal_to => 1000000 }

  validates :item_id,
            :presence => true

  validates :subject,
            :length => {:maximum => 25}

  validates :date,
            :presence => true
end
