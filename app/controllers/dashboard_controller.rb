class DashboardController < ApplicationController
  def index
    #@time = Time.now
    #@files = Dir.glob('*')
  end
  
  def about
    p @soc_net = params[:soc_net]
    p @item = params[:item]
    
    #curl -H "Authorization: Bearer <token>" "https://api.linkedin.com/v1/people/~:raman-skaskevich-919b92bb?format=json"
    https://api.linkedin.com/v1/people-search:(people:(raman-skaskevich-919b92bb))?first-name=parameter&last-name=parameter
  end
end
