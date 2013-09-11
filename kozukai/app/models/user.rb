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
    lists = [
      { :name => "食費",         :color => "FF0000" }, 
      { :name => "交際費",       :color => "FF9900" },
      { :name => "交通費",       :color => "FFFF00" },
      { :name => "生活費",       :color => "00FF00" },
      { :name => "趣味・娯楽費", :color => "0000FF" },
      { :name => "嗜好品",       :color => "330066" },
      { :name => "光熱費",       :color => "FF00FF" },
      { :name => "医療費",       :color => "FFB6C1" },
      { :name => "保険",         :color => "00FFFF" },
      { :name => "ローン代",     :color => "000000" }
    ]
    #names = ["a","b","c"]
    lists.each do |list|
      item = Item.new(:user_id => self.id, :name => list[:name], :color_code => list[:color])
      item.save!
    end
  end
end
