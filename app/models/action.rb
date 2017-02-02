class Action < ActiveRecord::Base
  validates_presence_of :action
  def to_s
  "#{action}"
  end

end
