class User < ApplicationRecord
    has_secure_password

    has_many :games, dependent: :destroy

    has_many :reviews, dependent: :destroy

    validates :company_name, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 50 }
    validates :admin, value: false
    validates :approved_user, value: false
    validates :number_of_employees, presence: false, numericality: true
    validates :email, presence: true, uniqueness: { case_sensitive: false }
    validates :password_digest, presence: true, length: { maximum: 75 }
    before_create { generate_token(:auth_token) }

    mount_uploader :image, ImageUploader

    def send_password_reset
        generate_token(:password_reset_token)
        self.password_reset_sent_at = Time.zone.now
        save!
        UserMailer.password_reset(self).deliver
    end

    def generate_token(column)
        begin
            self[column] = SecureRandom.urlsafe_base64
        end while User.exists?(column => self[column])
    end

    def func_company_name
        company_name.to_s.squeeze(' ').strip.titleize
    end
end
