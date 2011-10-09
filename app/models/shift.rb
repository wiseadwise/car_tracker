# encoding: utf-8
class Shift < ActiveRecord::Base

  TIMES = {
    :first  => '8-20',
    :second => '20-8'
  }

  belongs_to :master
  has_many :person_shifts, :dependent => :destroy
  has_many :drivers, :through => :person_shifts
  has_many :vehicles, :through => :person_shifts

  validates :master, :time, :date, :presence => true
  validates :time, :inclusion => TIMES.keys.map(&:to_s)
  validates :date, :uniqueness => { :scope => :time }

  default_scope :order => "date DESC"

  scope :in_period, lambda { |start, finish| where(["DATE(date) >= ? AND DATE(date) <= ?", start.to_date, finish.to_date]) }

  def time_name
    time == "first" ? 'Смена 1' : 'Смена 2'
  end

  def build_person_shifts(data)
    self.person_shifts = []
    data.each_value do |data|
      ps = person_shifts.build(data)
      ps.shift = self 
    end if data.present?
  end

  def trips_count
    person_shifts.map { |ps| ps.trips_count }.sum
  end


end
