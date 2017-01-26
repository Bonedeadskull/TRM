class Location < ActiveRecord::Base
  belongs_to :injury
  belongs_to :treatment

  def to_s
  "#{location}"
  end

end
