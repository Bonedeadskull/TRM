class Treatment < ActiveRecord::Base
  belongs_to :athlete
  belongs_to :trainer
  has_many :cures
  has_many :tactions, :through => :cures
  accepts_nested_attributes_for :cures, :allow_destroy => true
  validates_presence_of :athlete
  validates_presence_of :trainer
  def clone!
    r = self.dup
    r.date = Date.today.strftime("%m/%d/%Y")
    r.time = Time.now.strftime("%I:%M %p")
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
