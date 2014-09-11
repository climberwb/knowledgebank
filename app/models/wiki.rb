class Wiki < ActiveRecord::Base
  has_many :collaborations
  has_many :users, :through => :collaborations
  
  belongs_to :user
  default_scope { order('created_at DESC')}
  #validates :users, uniqueness: true

  def type?(base_type)
    type == base_type.to_s
  end
end
