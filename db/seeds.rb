p = Person.create(
  :role => 'admin',
  :first_name => "Admin",
  :last_name => 'Adminov'
)
User.create(
  :email => 'admin@local.com',
  :password => '123456',
  :password_confirmation => '123456',
  :person_id => p.id
)
Person.create(
  :role => 'driver',
  :first_name => "Driver",
  :last_name => 'Driverov'
)
Person.create(
  :role => 'master',
  :first_name => "Master",
  :last_name => 'Masterov'
)
Vehicle.create(
  :name => 'Belaz'
)
Vehicle.create(
  :name => 'Kraz'
)
