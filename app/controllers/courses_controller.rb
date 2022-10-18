class CoursesController < ApplicationController
  #action load to fetch courses and sectiones' info from the OSU API
  def load
    @courses = Course.fetch_courses(params[:term],params[:campus])
  end

  #action new to create a new User class instance in sign up page
  def new
    @course = Course.new
  end

  #action create to fetch user's info from the OSU API, and redirect to login in page if succeed
  def create
    @course=Course.new(course_params)
    if @course.save
      redirect_to trestle_path
    else
      render 'new'
    end
  end

  #the parameters that will be read from webpage to the user creation
  def course_params
    params.require(:course).permit(:title, :shortDescription, :component, :subject, :catalogNumber, :term)
  end
      
end
