class Admin::AdminController < ApplicationController
  layout 'admin'
  before_action :log_in_admin
  
  
  def index
  end
end
