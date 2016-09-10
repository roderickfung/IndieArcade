class User < ApplicationRecord
<<<<<<< HEAD
  validates :company_name, presence: true, uniqueness: {case_sensitive: false}, length: { maximum: 25 }
  validates :website, presence: false, uniqueness: {case_sensitive: false}
  validates :twitter, presence: false, uniqueness: {case_sensitive: false}
  validates :admin, presence: true
  validates :approved_user, presence: true
  validates :number_of_employees, presence: false, numericality: true
  validates :email, presence: true, uniqueness: {case_sensitive: false}
  validates :password_digest, presence: true, uniqueness: {case_sensitive: false}, length: { maximum: 25 }
=======

  has_many :games

  has_secure_password

>>>>>>> 1ea2528a499c881f1ab4cbfcd9e3a5458174696b
end
