class User < ActiveRecord::Base
	validates :email, presence: true, uniqueness: true, format: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
	validates :name, presence: true
	validates :password, presence: true, length: { in: 6..20 }
	validates :password_confirmation, presence: true
	has_secure_password

	has_many :statuses, dependent: :destroy
	has_many :likes, dependent: :destroy

end
