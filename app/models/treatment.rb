class Treatment < ActiveRecord::Base
  belongs_to :athlete
  belongs_to :trainer
  has_many :cures
  has_many :tactions, :through => :cures
  accepts_nested_attributes_for :cures, :allow_destroy => true
  def clone!
    r = self.dup
    r.save!

    [ :cures ].each do |c|
      self.send( c ).each do |child|
        n = child.dup
        n.treatment_id = r.id
        n.save!
      end
    end

    return r
  end

end
