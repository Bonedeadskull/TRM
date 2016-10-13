class Athlete < ActiveRecord::Base
  has_many :injuries
  has_many :treatments
  accepts_nested_attributes_for :injuries

  def to_s
  "#{first_name} #{last_name}"
  end
end
