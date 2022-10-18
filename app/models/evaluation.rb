#class about the evaluation page
class Evaluation < ApplicationRecord
    validates :catalogNumber, numericality: { only_integer: true }
    validates :catalogNumber, numericality: { greater_than: 1009 }
    validates :catalogNumber, numericality: { less_than: 9000 }
    validates :catalogNumber, presence: true

    validates :instructorDotName, presence: true
    validates :studentDotName, presence: true
end
