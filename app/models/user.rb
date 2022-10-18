require "json"
require "net/http"
require "digest"
#class about the user.this ruby file contains codes about user's functionality
class User < ApplicationRecord
  has_secure_password
  # validate the input format of the email address
  validates :email, presence:true, format: { with: /[A-Za-z.0-9]+@osu.edu/}
  include Trestle::Auth::ModelMethods
  include Trestle::Auth::ModelMethods::Rememberable

  # call the fetch_user function after create a new user in "Sign up"
  after_create :fetch_user!

  # this function is used to match the dot id in the email
  def use_regex(input) 
    regex = Regexp.new(/[A-Za-z]+\.[0-9]+/, Regexp::IGNORECASE) 
    regex.match input
  end


  # this function is used to fetch user's information with his dot name
  def fetch_user!
    user0=User.find_by(email:email)
    dotName = user0["dotName"]
    # If have no dot id, setting as the defualt guest
    if dotName.eql?"admin"
      user0["dotName"]=""
      user0["admin"]=true
    else
      dotName = use_regex(user0["email"]).to_s
      user0["dotName"]=dotName
      if dotName.empty? # If no dotname, consider as a guest
        user0["display_name"] = "Guest"
        user0["role"] = "Guest"
        user0["email"] = user0["email"]
        user0["admin"] = false
      else # Else, fetching the data from OSU API
        source = Net::HTTP.get_response(URI.parse("https://directory.osu.edu/fpjson.php?name_n=" + dotName))
        data = JSON.parse(source.body)

        if data.empty? # If no user info in api (e.g. alumni), consider as guest
          user0["display_name"] = "Guest"
          user0["role"] = "Guest"
          user0["email"] = user0["email"]
          user0["admin"] = false
        else
          user0["dotName"] = dotName
          user0["display_name"] = data[0]["display_name"]
          user0["email"] = data[0]["email"]
          user0["admin"] = false
          # judge whether user is a instructor or a student     
          if data[0]["appointments"].empty?
            if data[0]["majors"][0]["major"].empty?
              user0["role"] = "Guest"
            else 
              user0["role"] = "Student"
            end
          else
            user0["role"] = "Instructor"
          end
        end
      end
    end
    user0.save
  end

end
