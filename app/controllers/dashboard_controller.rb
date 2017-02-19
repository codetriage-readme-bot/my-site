class DashboardController < ApplicationController
  respond_to :html, :js
  
  def index
    respond_to do |format|
      format.html
      format.json
    end
  end
  
  def about
    @soc_net = params[:soc_net]
    @item = params[:item]
    
    if @soc_net == 'LinkedIn'

      jsonFile = File.read("/home/roman/workspace/romasks/app/controllers/resume.json")
      @jsonData = JSON.parse(jsonFile)
      
      @arr = Array.new
      @item = "Work" if @item == "Experience"
      @item = @item.downcase
      
      send("parse_#{@item}")
      
      @items = @arr
    end
    
  end
  
  def parse_summary
    # Summary
    @arr << @jsonData["basics"]["summary"]
  end
  
  def parse_skills
    # Skills
    @jsonData["skills"].each { |item|
      @arr << item['name']
    }
  end
  
  def parse_education
    # Education
    @jsonData["education"].each { |item|
      if item['studyType'] != ""
        type = ", #{item['studyType']}"
      else
        type = ""
      end
      @arr << "#{item['institution']}#{type} (#{item['startDate']} - #{item['endDate']})"
    }
  end
  
  def parse_work
    # Experience
    @jsonData["work"].each { |item|
      date_end = (item['endDate'] || 'current')
      @arr << "#{item['company']}, #{item['position']} (#{item['startDate']} - #{date_end})"
    }
  end
  
  def parse_languages
    # Languages
    @jsonData["languages"].each { |item|
      @arr << "#{item['language']} - #{item['fluency']}"
    }
  end
  
  def parse_courses
    # Courses
    # nothing there
  end
  
end
