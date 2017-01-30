class Action < ActiveRecord::Base
  has_many :treatmentactions
  has_many :treatments, :through => :treatmentactions
  accepts_nested_attributes_for :treatmentactions

  def to_s
  "#{action}"
  end

end
