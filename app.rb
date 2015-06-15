require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/artwork")
require("./lib/museum")
require("pg")
require('pry')

DB = PG.connect({:dbname => 'museum_tracker'})

get('/') do
  erb(:index)
end

get('/museums/new') do
  erb(:museum_form)
end

post('/museums') do
  name = params.fetch("name")
  museum = Museum.new({:name => name, :id => nil})
  museum.save()
  erb(:success)
end

get('/museums') do
  @museums = Museum.all()
  erb(:museums)
end

get('/museums/:id') do
  @museum = Museum.find(params.fetch("id").to_i())
  erb(:museum)
end


post('/artworks') do
  description = params.fetch("description")
  museum_id = params.fetch("museum_id").to_i()
  @museum = Museum.find(museum_id)
  @artwork = Artwork.new({:description => description, :museum_id => museum_id})
  @artwork.save()
  erb(:artwork_success)
end

post('/museums/:id') do
  museum_id = params.fetch('id').to_i()
  @museum = Museum.find(museum_id)
  @artwork = params.fetch("artwork_name")
  @artwork = Artwork.new({:description => @artwork, :museum_id => museum_id})
  @artwork.save()
  erb(:museum)
end

get("/museums/:id/edit") do
  @museum = Museum.find(params.fetch("id").to_i())
  erb(:museum_edit)
end

get("museums/:id/edit") do
  @museum = Museum.find(params.fetch("id").to_i())
  erb(:museum_edit)
end

patch("/museums/:id") do
  name = params.fetch("name")
  @museum = Museum.find(params.fetch("id").to_i())
  @museum.update({:name => name})
  erb(:museum)
end

delete("/museums/:id") do
  @museum = Museum.find(params.fetch("id").to_i())
  @museum.delete()
  @museums = Museum.all()
  erb(:index)
end
