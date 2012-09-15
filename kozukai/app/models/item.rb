class Item < ActiveRecord::Base
  attr_accessible :name, :color_code, 
                  :default_price, :order, :user_id

  validates :name,
            :presence => true,
            :uniqueness => {:scope => :user_id},
            :length => { :maximum => 20 }

  validates :color_code,
            :presence => true,
            :format => { :with => /[A-Za-z0-9]{6}/ }

  validates :default_price,
            :numericality => { :greater_than_or_equal_to => 0,
                               :less_than_or_equal_to => 1000000 }
end
