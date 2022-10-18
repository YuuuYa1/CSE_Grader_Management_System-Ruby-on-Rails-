class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
    
     # t.string :classNumber
      t.string :catalogNumber
      t.string :section
      t.string :component
      t.string :instructionMode
      t.string :buildingDescription
      t.string :startTime
      t.string :endTime
      t.string :startDate
      t.string :endDate
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.boolean :saturday
      t.boolean :sunday
      t.string :instructors
      t.string :graderDemand
      t.timestamps
    end
  end
end
