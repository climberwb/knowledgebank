class Collaboration < ActiveRecord::Base
  belongs_to :user
  belongs_to :wiki
  attr_accessor :user_name


end
