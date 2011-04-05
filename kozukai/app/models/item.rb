class Item < ActiveRecord::Base
  validates :name,
            :presence => true,
            :uniqueness => true,
            :length => { :maximum => 20 }
end
