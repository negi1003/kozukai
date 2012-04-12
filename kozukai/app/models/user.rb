# encoding: utf-8
class User < ActiveRecord::Base
  after_create :create_default_data
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  private

  def create_default_data
    ActiveRecord::Base.transaction do
      create_setting
      create_items
    end
  end

  def create_setting
    st = Setting.new(:user_id => self.id, :cutoff_date => 1)
    st.save!
  end

  def create_items
    names = ["食費", "交際費", "交通費", "生活費", "趣味・娯楽費", "嗜好品", "光熱費", "医療費", "保険", "ローン代"]
    #names = ["a","b","c"]
    names.each do |name|
      item = Item.new(:user_id => self.id, :name => name)
      item.save!
    end
  end
end
