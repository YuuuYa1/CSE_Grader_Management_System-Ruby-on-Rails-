class CreateForms < ActiveRecord::Migration[7.0]
  def change
    create_table :forms do |t|
      t.boolean :accept
      t.boolean :deny
      t.string :term
      t.string :catalogNumber
      t.string :campus
      t.string :sectionNum
      t.string :applicantId
      t.boolean :monday
      t.boolean :tuesday
      t.boolean :wednesday
      t.boolean :thursday
      t.boolean :friday
      t.string :createDate
      t.string :freetime
      t.timestamps
    end
  end
end
