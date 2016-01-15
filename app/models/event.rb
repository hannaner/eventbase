class Event < ActiveRecord::Base
  belongs_to :location
  belongs_to :user
  has_many :comments
  has_many :attendances
  validates :name, presence: true
  validates :date, presence: true

  # def date
  # 	errors.add(:date, "Must be valid date") if
  # 		!date.blank? and date < Date.today
  # 	end
  # end

end
