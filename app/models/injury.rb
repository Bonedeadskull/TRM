class Injury < ActiveRecord::Base
  belongs_to :athlete

  def to_s
  "#{date}"
  end
end
