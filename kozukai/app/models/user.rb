class User < ActiveRecord::Base
  after_create :create_setting
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  private
  def create_setting
    st = Setting.new(:user_id => self.id, :cutoff_date => 1)
    st.save!
  end
end
