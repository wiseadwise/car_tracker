class Vehicle < ActiveRecord::Base

  validates :identifier, :presence => true, :uniqueness => true
  validates :name, :presence => true

  before_validation(:set_identifier, :on => :create)

  has_many :trips
  has_many :person_shifts

  protected

  def set_identifier
    self.identifier = (Vehicle.maximum(:identifier) || 0) + 1
  end

end
