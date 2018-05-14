class Mark < ApplicationRecord
  belongs_to :student
  belongs_to :teacher
  validates :student_id, uniqueness: { scope: :teacher_id}
  validates :marks, numericality: true
  validate :marks_limit
  def marks_limit
  	if self.marks.nil?
  		errors.add(:marks, "cannot be blank")
  	elsif marks > 100
      errors.add(:marks, "cannot be above 100")
    elsif marks < 0
      errors.add(:marks, "cannot be below 0")
    end
  end  
end
