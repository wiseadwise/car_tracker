class Shift < ActiveRecord::Base

  TIMES = {
    :first => '8-20',
    :second => '20-8'
  }

  belongs_to :person

  validates :person, :time, :date, :presence => true
  validates :time, :inclusion => TIMES.keys.map(&:to_s)

end
