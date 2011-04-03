class Users::SessionsController < Devise::SessionsController
  devise_for :users, :controllers => { :sessions => "users/sessions" }
end

