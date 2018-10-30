class User < ApplicationRecord
  before_save {email.downcase!}
  validates :name,  presence: true, length: {maximum: Settings.max.num_50}
end
