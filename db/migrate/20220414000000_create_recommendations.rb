class CreateRecommendations < ActiveRecord::Migration[7.0]
    def change
      create_table :recommendations do |t|
        t.string :catalogNumber
        t.string :instructorDotName
        t.string :studentDotName
        t.text :comment
        t.boolean :excellent
        t.timestamps
      end
    end
  end
  