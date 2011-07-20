# encoding: utf-8
class Person < ActiveRecord::Base

  validates :first_name, :second_name, :last_name, :presence => true

  has_one :user

  ROLES = {
    :admin => 'Администартор',
    :master => 'Мастер',
    :manager => 'Секретарь',
    :driver => 'Водитель'
  }

  EMPLOYEE_ROLES = [ :driver, :master ]

  scope :employee, where(:role => EMPLOYEE_ROLES)

  validates :role, :presence => true, :inclusion => { :in => ROLES.keys.map(&:to_s) }

  def name
    [ first_name, last_name ].join(' ')
  end

  def full_name
    [ last_name, first_name, second_name ].join(' ')
  end

end
