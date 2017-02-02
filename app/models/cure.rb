class Cure < ActiveRecord::Base
  belongs_to :treatment
  belongs_to :action

  def to_s
  "#{action}"
  end

end
