class User < ActiveRecord::Base

  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i

  has_secure_password
  has_many :events
  has_many :attendees
  has_many :attending_events, through: :attendees, source: :event
  has_many :comments
  has_many :commented_events, through: :comments, source: :event

  validates :first_name, :last_name, :email, :location, :state, presence: true
  validates :email, format: { with: EMAIL_REGEX }, uniqueness: { case_sensitive: false}
end