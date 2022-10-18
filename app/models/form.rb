#class about the course and section form
class Form < ApplicationRecord
    # after_create :log_debug!
    # def log_debug!
    #     app0=Form.find_by(catalogNumber:catalogNumber)
    #     logger.debug("-----------------#{app0.}")
    # end
    validates :catalogNumber, numericality: { only_integer: true }
    validates :catalogNumber, numericality: { greater_than: 1009 }
    validates :catalogNumber, numericality: { less_than: 9000 }
    validates :catalogNumber, presence: true

    validates :sectionNum, presence: true
    validates :term, presence: true
    validates :campus, presence: true
    validates :applicantId, presence: true

end
