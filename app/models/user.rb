class User < ActiveRecord::Base
	
    before_save :create_avatar_url

	
	has_secure_password
    has_many :ribbits



	before_validation :prep_email
	validates :name, presence: true
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
     
     private
         def prep_email
         	self.email = self.email.strip.downcase if self.email
        end

        def create_avatar_url
        	self.avatar_url = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=50"
        end

        
end
