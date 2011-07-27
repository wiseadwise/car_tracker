class Shift < ActiveRecord::Base

  TIMES = {
    :first  => '8-20',
    :second => '20-8'
  }

  belongs_to :master, :class_name => 'Person', :foreign_key => :person_id
  has_many :person_shifts
  has_many :drivers, :through => :person_shifts, :source => :person
  has_many :vehicles, :through => :person_shifts

  validates :master, :time, :date, :presence => true
  validates :time, :inclusion => TIMES.keys.map(&:to_s)

end
