class Event < ActiveRecord::Base

  belongs_to :user
  has_many :attendees
  has_many :users, through: :attendees, source: :user
  has_many :comments
  validates :name, presence: true, length: { minimum: 2, maximum:100 }
  validates :date, inclusion: { in: (Date.today..Date.today+5.years), message: "Date cant be in the past" }
end
