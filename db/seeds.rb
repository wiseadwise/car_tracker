p = Admin.create(
  :first_name => "Admin",
  :second_name => 'Sergeevich',
  :last_name => 'Adminov'
)
User.create(
  :email => 'test@local.com',
  :password => '123456',
  :password_confirmation => '123456',
  :person_id => p.id
)
Driver.create(
  :first_name => "Driver",
  :second_name => 'Sergeevich',
  :last_name => 'Driverov'
)
Master.create(
  :first_name => "Master",
  :second_name => 'Sergeevich',
  :last_name => 'Masterov'
)
Vehicle.create(
  :name => 'Belaz'
)
Vehicle.create(
  :name => 'Kraz'
)
