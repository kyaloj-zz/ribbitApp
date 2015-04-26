class Ribbit < ActiveRecord::Base

  default_scope {order('created_at DESC')}
  #attr_accessible :content, :userid
  belongs_to :user
 
  validates :context, length: { maximum: 140 }

end
