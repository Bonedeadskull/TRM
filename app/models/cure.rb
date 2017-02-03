class Cure < ActiveRecord::Base
  belongs_to :treatment
  belongs_to :taction

  def to_s
  "#{name}"
  end

end
