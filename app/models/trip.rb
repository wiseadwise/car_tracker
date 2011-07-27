class Trip < ActiveRecord::Base

  belongs_to :vehicle
  has_attached_file :image

end
