class User < ApplicationRecord
  before_save {email.downcase!}
  validates :name,  presence: true,
    length: {maximum: Settings.num_50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
    length: {maximum: Settings.num_255}, format: {with:VALID_EMAIL_REGEX},
    uniqueness: true, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.num_6},
    allow_nil: true
  has_secure_password

  scope :select_user, -> {select :id, :name, :email}
  scope :order_by_created, -> {order created_at: :asc}

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update remember_digest: User.digest(remember_token)
  end

  def authenticated? remember_token
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password? remember_token
  end

  def forget
    update remember_digest: nil
  end
end
