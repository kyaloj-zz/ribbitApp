class User < ActiveRecord::Base
	
    before_save :create_avatar_url

	
	has_secure_password
    has_many :ribbits

    has_many :follower_relationships, classname: "Relationship", foreign_key: "follower_id"
    has_many :followed_relationships, classname: "Relationship", foreign_key: "follower_id"
    
    has_many :followers, through: :follower_relationships
    has_many :followeds, through: :followed_relationships


	before_validation :prep_email
	validates :name, presence: true
	validates :username, presence: true, uniqueness: true
	validates :email, presence: true, uniqueness: true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/ }
     

    def following? user
          self.followeds.include? user
    end
 
    def follow user
          Relationship.create follower_id: self.id, followed_id: user.id
    end

     private
         def prep_email
         	self.email = self.email.strip.downcase if self.email
        end

        def create_avatar_url
        	self.avatar_url = "http://www.gravatar.com/avatar/#{Digest::MD5.hexdigest(self.email)}?s=50"
        end

        
end
