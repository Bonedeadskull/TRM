class Injury < ActiveRecord::Base
  belongs_to :athlete
  validates_presence_of :athlete

  def to_s
  "#{date}"
  end
end
