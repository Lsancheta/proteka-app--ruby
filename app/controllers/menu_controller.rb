class MenuController < ApplicationController
  before_action :require_login
  helper_method :current_user
  
  def index
  end
  
end
