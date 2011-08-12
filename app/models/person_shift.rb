class PersonShift < ActiveRecord::Base

  belongs_to :driver
  belongs_to :shift
  belongs_to :vehicle

  validates :driver, :shift, :vehicle, :presence => true

  scope :for_person, lambda { |person| where(:driver_id => person.id) }

end
