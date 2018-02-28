class User < ApplicationRecord
	has_many :posts, dependent: :destroy
	has_many :comments, dependent: :destroy

	validates :email, presence: true, uniqueness: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :password, presence: true, length: {minimum: 6}

	scope :last_3_days, -> {
		User.where('created_at between ? and ?', DateTime.now - 3.days, Time.now)
	}

	scope :no_bio, -> {
		where("bio IS ? OR bio IS ?", nil, '')
	}

	scope :authenticate_login,  -> (email, password) {
		user = User.find_by(email: email)
		if user && user.password == password
			user
		end
	}
end