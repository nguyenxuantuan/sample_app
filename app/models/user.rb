class User < ApplicationRecord
  before_save {email.downcase!}
  validates :name,  presence: true, length: {maximum: Settings.maximum.num_50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: {maximum: Settings.maximum.num_255}, format: {with:VALID_EMAIL_REGEX}, uniqueness: true, uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true, length: {minimum: Settings.minimum.num_6}
end
