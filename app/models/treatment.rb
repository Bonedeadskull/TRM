class Treatment < ActiveRecord::Base
  belongs_to :athlete
  belongs_to :trainer
  has_many :locations
  has_many :actions

end
