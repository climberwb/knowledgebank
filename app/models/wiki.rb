class Wiki < ActiveRecord::Base
  belongs_to :user
  
  default_scope { order('created_at DESC')}

  def type?(base_type)
    type == base_type.to_s
  end
end
