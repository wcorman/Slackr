class User < ApplicationRecord
  has_many :slacks, dependent: :destroy

  before_create :generate_api_key

  has_secure_password

  validates :first_name, :last_name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  # attr_accessor :email, :first_name, :last_name, :password

  validates :email,
    presence: true,
    uniqueness: true,
    format: VALID_EMAIL_REGEX


    def full_name
      "#{first_name} #{last_name}".strip
    end

  private
    def generate_api_key
      loop do
        self.api_key = SecureRandom.hex(32)
        break unless User.exists?(api_key: api_key)
      end
    end
end
