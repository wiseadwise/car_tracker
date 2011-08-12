class Master < Person

  has_many :shifts, :dependent => :destroy

  def trips(shift)
    Trip.for_date(shift.date.to_date)
  end

  def trips_count(shift)
    shifts.map { |s| s.person_shifts.sum(:trips_count) }.sum
  end

end
