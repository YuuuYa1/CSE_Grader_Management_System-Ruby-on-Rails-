#class about the recommendation page
class Recommendation < ApplicationRecord    
    validates :catalogNumber, numericality: { only_integer: true }
    validates :catalogNumber, numericality: { greater_than: 1009 }
    validates :catalogNumber, numericality: { less_than: 9000 }
    validates :catalogNumber, presence: true

    validates :instructorDotName, presence: true
    validates :studentDotName, presence: true
    validates :comment, presence: true
end
