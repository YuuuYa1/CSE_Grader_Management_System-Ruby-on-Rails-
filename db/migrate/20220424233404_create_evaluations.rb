class CreateEvaluations < ActiveRecord::Migration[7.0]
  def change
    create_table :evaluations do |t|
      t.string :catalogNumber
      t.string :instructorDotName
      t.string :studentDotName
      t.string :section
      t.string :knowledgeable
      t.string :motivated
      t.string :patient
      t.string :overall
      t.text :comment
      t.timestamps
    end
  end
end
