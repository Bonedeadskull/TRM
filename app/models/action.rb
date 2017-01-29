class Action < ActiveRecord::Base
  belongs_to :treatment

  def to_s
  "#{action}"
  end

end
