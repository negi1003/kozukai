class Setting < ActiveRecord::Base
  belongs_to :user

  attr_accessible :cutoff_date, :user_id


  validates :user_id,
            :presence => true,
            :uniqueness => true

  validates :cutoff_date,
            :presence => true,
            :numericality => { :greater_than_or_equal_to => 1,
                               :less_than_or_equal_to => 28 }
end
