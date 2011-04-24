class HomeController < ApplicationController
  helper :calendar

  before_filter :authenticate_user!
  def index
  end

end
