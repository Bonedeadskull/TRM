class Treatment < ActiveRecord::Base
  belongs_to :athlete
  belongs_to :trainer
end
