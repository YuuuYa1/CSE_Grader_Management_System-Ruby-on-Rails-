class CreateCourses < ActiveRecord::Migration[7.0]
  def change
    create_table :courses do |t|
      t.string :term
      t.string :title
      t.string :shortDescription
      #t.text :description
      t.string :component
      t.string :subject
      t.text :maxUnits
      t.string :catalogNumber
      t.string :academicCareer
      t.string :catalogLevel
      #t.string :campusCode
     # t.string :courseAttributes
     # t.string :courseId
      t.string :graderDemand
      t.timestamps
    end
  end
end
