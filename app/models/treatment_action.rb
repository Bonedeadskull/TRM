class TreatmentAction < ActiveRecord::Base
  belongs_to :treatments
  belongs_to :actions
end
