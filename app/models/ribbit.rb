class Ribbit < ActiveRecord::Base

  default_scope {where(order: 'createdat DESC')}
  attr_accessible :content, :userid
  belongs_to :user
 
  validates :content, length: { maximum: 140 }

end
