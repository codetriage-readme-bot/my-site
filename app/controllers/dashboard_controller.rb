class DashboardController < ApplicationController
  def index
    #@time = Time.now
    #@files = Dir.glob('*')
  end
  
  def about
    p @soc_net = params[:soc_net]
    p @item = params[:item]
  end
end
