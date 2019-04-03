class Cat < ApplicationRecord
  validates :color, inclusion: %w(white brown black orange)
  validates :sex, inclusion: %w(M F)
  validates :color, :sex, :birth_date, :name, :description, presence: true 
  
  def age 
    now = Time.now.utc.to_date
    now.year - self.birth_date.year - ((now.month > self.birth_date.month || (now.month == self.birth_date.month && now.day >= self.birth_date.day)) ? 0 : 1)
  end
end
