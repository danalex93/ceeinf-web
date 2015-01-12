class User < ActiveRecord::Base
	CHECK_REGEX = /.*.usm.cl|.*.utfsm.cl/

	devise :database_authenticatable, :registerable, :confirmable,
		:recoverable, :rememberable, :trackable, :validatable, :omniauthable,
		:omniauth_providers => [:google_oauth2]

	def self.find_for_google_oauth2(access_token, signed_in_resource=nil)
		data = access_token.info
		user = User.where(:email => data["email"]).first

		unless user
			user = User.create(
				name: data["name"],
				email: data["email"],
				password: Devise.friendly_token[0,20],
				ceeinf: false
			)
		end
		user
	end
end