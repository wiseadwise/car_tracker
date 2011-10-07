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
Driver.create(
  :first_name => "Helper",
  :second_name => 'Goodboy',
  :last_name => 'Machanizovich'
)
Master.create(
  :first_name => "Master",
  :second_name => 'Sergeevich',
  :last_name => 'Masterov'
)
Master.create(
  :first_name => "LoMaster",
  :second_name => 'Petrovich',
  :last_name => 'Lomasterov'
)
Vehicle.create(
  :name => 'Belaz'
)
Vehicle.create(
  :name => 'Kraz'
)
vehicles = Vehicle.all
100.times do |i|
  Trip.create(:vehicle => vehicles.sample, :created_at => Time.now - (60 * i).minutes) 
end
