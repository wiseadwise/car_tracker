class Driver < Person

  has_many :person_shifts, :dependent => :destroy
  has_many :shifts, :through => :person_shifts, :uniq => true

  def trips(shift)
    vehicles = shift.person_shifts.for_person(self).map { |ps| ps.vehicle }
    Trip.for_date(shift.date.to_date).where(:vehicle_id => vehicles.map { |v| v.id })
  end

  def trips_count(shift)
    shift.person_shifts.for_person(self).sum(:trips_count)
  end

end
