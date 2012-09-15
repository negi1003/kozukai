class Users::RegistrationsController < Devise::RegistrationsController
  before_filter :test3
  
  private
  def test3
    p "__________________________"
    p "__________________________"
    p "__________________________"
    p "__________________________"
    p "__________________________"
  end
end
