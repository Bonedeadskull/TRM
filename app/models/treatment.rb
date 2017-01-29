class Treatment < ActiveRecord::Base
  belongs_to :athlete
  belongs_to :trainer
  has_many :actions; accepts_nested_attributes_for :actions
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
