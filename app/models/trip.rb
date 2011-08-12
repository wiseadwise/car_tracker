class Trip < ActiveRecord::Base

  belongs_to :vehicle
  has_attached_file :image

  scope :for_date, lambda { |date| where(["DATE(created_at) = ?", date]) }

  def driver
    Shift.where("DATE(date) = Date(?)", created_at).first.person_shifts.where(:vehicle_id => vehicle_id).first.driver
  end

  def self.for_shift(date, time)
    date = date.to_date
    if time == "first"
      start = date + 8.hours
      finish = date + 20.hours
    else
      start = date + 20.hours
      finish = date + 32.hours
    end
    Trip.where(["created_at >= ? AND created_at < ?", start, finish])
  end

end
