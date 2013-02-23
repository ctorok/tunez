require 'open-uri' #rails, allows you to connect to the internet
class VideosController < ApplicationController
  def index
    @videos = Video.all
  end
  def new
  end
  def search
    # raise params.inspect
    search = params[:video] #this gets the variable you type in the search box
    url = "http://youtube.com/results?search_query=#{search}"
    html = Nokogiri::HTML(open(url))
    # binding.pry
    lis = html.css('#search-results li')
    lis.each do |li|
      url = li.get_attribute('data-context-item-id')
      # views = li.get_attribute('data-context-item-views')
      title = li.get_attribute('data-context-item-title')
      Video.create(:title => title, :url => url)
    end
    redirect_to(videos_path) #redirects to index path
  end
end