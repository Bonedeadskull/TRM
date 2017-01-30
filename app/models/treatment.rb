class Treatment < ActiveRecord::Base
  has_many :treatmentactions
  has_many :actions, :through => :treatmentactions
  accepts_nested_attributes_for :treatmentactions
  def clone!
    r = self.dup
    r.save!

    [ :actions ].each do |c|
      self.send( c ).each do |child|
        n = child.dup
        n.treatment_id = r.id
        n.save!
      end
    end

    return r
  end

end
