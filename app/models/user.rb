class User < ApplicationRecord
  has_secure_password

  has_many :games

  validates :company_name, presence: true, uniqueness: {case_sensitive: false}, length: { maximum: 25 }
  validates :website, presence: false, uniqueness: {case_sensitive: false}
  validates :twitter, presence: false, uniqueness: {case_sensitive: false}
  validates :admin, presence: true
  validates :approved_user, presence: true
  validates :number_of_employees, presence: false, numericality: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password_digest, presence: true, length: { maximum: 25 }
end
