class DashboardController < ApplicationController
  def index
    #@time = Time.now
    #@files = Dir.glob('*')
  end
  
  def about
    p @soc_net = params[:soc_net]
    p @item = params[:item]
    
    #curl -H "Authorization: Bearer <token>" "https://api.linkedin.com/v1/people/~:raman-skaskevich-919b92bb?format=json"
    #https://api.linkedin.com/v1/people-search:(people:(raman-skaskevich-919b92bb))?first-name=parameter&last-name=parameter
    
    getListOfItems()
  end
  
  def getListOfItems()
    # 1 - Determine social network
    if @soc_net == 'LinkedIn'

      # 2 - Parse corresponding file
      jsonFile = File.read("/home/roman/workspace/romasks/app/controllers/resume.json")
      jsonData = JSON.parse(jsonFile)
      
      # 3 - Search needed items
      
      # Summary
      if @item == "Summary"
        hash = jsonData["basics"]
        str = hash["summary"]
        arr = Array.new
        arr << str
        @items = arr
      end
      
      # Skills
      if @item == "Skills"
        hash = jsonData["skills"]
        
        arr = Array.new
        hash.each { |item|
          arr << item['name']
        }
        
        @items = arr
      end
      
      # Experience
      if @item == "Experience"
        hash = jsonData["work"]
    
        arr = Array.new
        hash.each { |item|
          date_end = (item['endDate'] || 'current')
          str = "#{item['company']}, #{item['position']} \n (#{item['startDate']} - #{date_end})"
          arr << str
        }
        
        @items = arr
      end
      
      # Education
      if @item == "Education"
        hash = jsonData["education"]
    
        arr = Array.new
        hash.each { |item|
          if item['studyType'] != ""
            type = ", #{item['studyType']}"
          else
            type = ""
          end
          
          str = "#{item['institution']}#{type} (#{item['startDate']} - #{item['endDate']})"
          arr << str
        }
        
        @items = arr
      end
      
      # Languages
      if @item == "Languages"
        hash = jsonData["languages"]
    
        arr = Array.new
        hash.each { |item|
          str = "#{item['language']} - #{item['fluency']}"
          arr << str
        }
        
        @items = arr
      end
      
      # Courses
      if @item == "Courses"
        arr = Array.new
        @items = arr
      end
      
    end    
  end
end
