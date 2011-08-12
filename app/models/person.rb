# encoding: utf-8
class Person < ActiveRecord::Base

  validates :first_name, :second_name, :last_name, :presence => true

  has_one :user

  ROLES = {
    :admin   => 'Администартор',
    :master  => 'Мастер',
    :manager => 'Секретарь',
    :driver  => 'Водитель'
  }

  EMPLOYEE_ROLES = [ :driver, :master ]

  scope :employee, where(:type => EMPLOYEE_ROLES.map { |role| role.to_s.capitalize })

  def name
    [ first_name, last_name ].join(' ')
  end

  def full_name
    [ last_name, first_name, second_name ].join(' ')
  end

  def short_name
    "#{first_name.first}. #{second_name.first}. #{last_name}"
  end

  def role
    ROLES[self.class.name.underscore.to_sym]
  end

end
