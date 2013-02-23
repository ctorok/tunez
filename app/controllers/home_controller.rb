class HomeController < ApplicationController
  layout 'homepage' #loads the home_controller instead of the default application_controller. You could create a different layout for every controller

  def index
  end
end