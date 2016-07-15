require 'pg'
require 'rspec'
require 'capybara/rspec'
require 'stylist'


DB = PG.connect({dbname: "hair_salon_test"})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM stylists *")
  end
end
