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
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:clients)
end

post ('/clients') do
  Client.new({name: params['name'], phone: params['phone'], stylist_id: params['stylist_id'].to_i}).save()
  @clients = Client.all()
  @stylists = Stylist.all()
  erb(:clients)
end








get ('/client/:id') do
  @client = Client.find_by_id(params[:id])
  @stylists = Stylist.all()
  erb(:client)
end


patch ('/client/:id') do
  @client = Client.find_by_id(params[:id])
  @client = @client.update({name: params['name'], phone: params['phone'], stylist_id: params['stylist_id'].to_i})
  @stylists = Stylist.all()
  erb(:client)
end

delete ('/client/:id') do
  @client = Client.find_by_id(params[:id]).delete()
  redirect '/clients'
end







get('/stylists') do
  @stylists = Stylist.all()
  erb(:stylists)
end

post ('/stylists') do
  Stylist.new({name: params['name'], rate: params['rate'], id: nil}).save()
  @stylists = Stylist.all()
  erb(:stylists)
end







get ('/stylist/:id') do
  @stylist = Stylist.find_by_id(params[:id])
  @clients = @stylist.find_clients()
  erb(:stylist)
end

post ('/stylist/:id') do
  erb(:stylist)
end

patch ('/stylist/:id') do
  @stylist = Stylist.find_by_id(params[:id]).update({name: params['name'], rate: params['rate']})
  @clients = @stylist.find_clients()
  erb(:stylist)
end

delete ('/stylist/:id') do
  @stylist = Stylist.find_by_id(params[:id]).delete()
  redirect '/stylists'
end
