require 'sinatra'
require 'sinatra/reloader'
require 'pry'
require 'pg'
require './lib/client'
require './lib/stylist'
also_reload './lib/**/*.rb'

DB = PG.connect({dbname: 'hair_salon_test'})

get('/') do
  erb(:index)
end





get('/clients') do
  erb(:clients)
end

post ('/clients') do
  erb(:clients)
end








get ('/client/:id') do
  erb(:client)
end

post ('/client/:id') do
  erb(:client)
end

patch ('/client/:id') do
  erb(:client)
end

delete ('/client/:id') do
  erb(:client)
end







get('/stylists') do
  erb(:stylists)
end

post ('/stylists') do
  erb(:stylists)
end







get ('/stylist/:id') do
  erb(:stylist)
end

post ('/stylist/:id') do
  erb(:stylist)
end

patch ('/stylist/:id') do
  erb(:stylist)
end

delete ('/stylist/:id') do
  erb(:stylist)
end
