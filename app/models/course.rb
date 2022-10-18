require "json"
require "net/http"
require "digest"
#class about the course and section pages
class Course < ApplicationRecord
    include ActiveModel::Serializers::JSON

    # delete all courses and sections before reloading
    Course.delete_all
    Section.delete_all

    #this function is for saving the newest courses and sections to database, by sending a get request and parsing the file responded
    def self.fetch_courses(term,campus)
    	Course.delete_all
    	Section.delete_all
    	link=""
    	a="https://content.osu.edu/v2/classes/search?q=cse&campus="
    	b="&p=1&term="
    	c="&subject=cse"
    	if term==nil
 		term= "1222"
 	end
 	if campus==nil
 		campus= "nwk"
 	end
    	link=(a+campus+b+term+c)
    	
    	source = Net::HTTP.get_response(URI.parse(link))
    	
  	
    	#send a get request for the json file containing all info needed
       	# source = Net::HTTP.get_response(URI.parse("https://content.osu.edu/v2/classes/search?q=cse&campus=col&p=1&term=1228&subject=cse"))
        data = JSON.parse(source.body)
        courses = data["data"]["courses"]

        #iterate and process every section of each course, and save them to database
        courses.each { |i| 
            course = Course.new
            course_attr = Course.course_data_filter(i["course"])
            course.from_json(course_attr.to_json)
            sections = i["sections"]
            sections.each { |j| 
                section = Section.new
                section_attr = Course.section_data_filter(j)
                section.from_json(section_attr.to_json)
                section.save
            }
            course.save
        }
    end

    private
        def self.course_data_filter (info)
        	@course = Hash.new
        	@course["catalogNumber"] = info["catalogNumber"]
        	@course["term"] = info["term"]
    		@course["title"] = info["title"]
    		@course["shortDescription"] = info["shortDescription"]
    		@course["component"] = info["component"]
    		@course["subject"] = info["subject"]
    		@course["maxUnits"] = info["maxUnits"]
    		@course["academicCareer"] = info["academicCareer"]
    		@course["catalogLevel"] = info["catalogLevel"]
    		@course

        end

        def self.section_data_filter (info)
        	@section = Hash.new
        	@section["catalogNumber"] = info["catalogNumber"]
        	@section["section"] = info["section"]
        	@section["component"] = info["component"]
        	@section["instructionMode"] = info["instructionMode"]
			@section["buildingDescription"] = info["meetings"][0]["buildingDescription"]
    		@section["startTime"] = info["meetings"][0]["startTime"]
          	@section["endTime"] = info["meetings"][0]["endTime"]
         	@section["startDate"] = info["meetings"][0]["startDate"]
          	@section["endDate"] = info["meetings"][0]["endDate"]
          	@section["monday"] = info["meetings"][0]["monday"]
          	@section["tuesday"] = info["meetings"][0]["tuesday"]
          	@section["wednesday"] = info["meetings"][0]["wednesday"]
          	@section["thursday"] = info["meetings"][0]["thursday"]
          	@section["friday"] = info["meetings"][0]["friday"]
          	@section["saturday"] = info["meetings"][0]["saturday"]
          	@section["sunday"] = info["meetings"][0]["sunday"]
          	@section["instructors"] = info["meetings"][0]["instructors"][0]["displayName"]
            @section["graderDemand"] = 2
          	@section
        end

    end

