class PersonShift < ActiveRecord::Base

  belongs_to :person
  belongs_to :shift
  belongs_to :vehicle

  validates :person, :shift, :vehicle, :presence => true

end
