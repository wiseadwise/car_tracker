# encoding: utf-8
class Shift < ActiveRecord::Base

  TIMES = {
    :first  => '8-20',
    :second => '20-8'
  }

  belongs_to :master
  has_many :person_shifts
  has_many :drivers, :through => :person_shifts
  has_many :vehicles, :through => :person_shifts

  validates :master, :time, :date, :presence => true
  validates :time, :inclusion => TIMES.keys.map(&:to_s)

  def time_name
    time == "first" ? 'Смена 1' : 'Смена 2'
  end

end
