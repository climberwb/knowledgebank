class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #, :confirmable
  
  has_many :collaborations
  
  # wikis I was given access to
  has_many :collaborated_wikis, :through => :collaborations, source: :wiki

  # wikis I created
  has_many :wikis

  def role?(base_role)
    role == base_role.to_s
  end

  def collaborator?(base_collaborator)
   collaborator == base_collaborator
 end
end
