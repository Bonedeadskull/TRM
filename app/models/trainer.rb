class Trainer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  has_many :treatments
  devise :database_authenticatable,
         :rememberable,
         :trackable,
         :validatable,
         :authentication_keys => [:username]

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def display_name
    return "#{first_name}" + " #{last_name}"
  end

  def to_s
      "#{first_name}"
  end
end
