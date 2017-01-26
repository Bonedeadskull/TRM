class Injury < ActiveRecord::Base
  belongs_to :athlete
  has_many :locations

  def to_s
  "#{date}"
  end
end
