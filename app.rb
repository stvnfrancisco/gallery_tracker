require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/museum")
require("./lib/artwork")
require("pg")
require('pry')

DB = PG.connect({:dbname => 'museum_tracker'})

get("/") do
  erb(:index)
end

get("/museum/new") do
  erb(:museum_form)
end

post("/museums") do
  name = params.fetch("name")
  museum = Museum.new({:name => name, :id => nil})
  museum.save()
  erb(:success)
end

get('/museums') do
  @museums = Museum.all()
  erb(:museums)
end

get("/museums/:id") do
  @muesum = Museum.find(params.fetch("id").to_i())
  erb(:museum)
end


post("/artworks") do
  name = params.fetch("name")
  museum_id = params.fetch("museum_id").to_i()
  @museum = Museum.find(museum_id)
  @artwork = Artwork.new({:name => name, :museum_id => museum_id})
  @artwork.save()
  erb(:success)
end

post('/museums/:id') do
  list_id = params.fetch('id').to_i()
  @museum = Museum.find(museum_id)
  @artwork = params.fetch("artwork_name")
  @artwork = Artwork.new({:name => @artwork, :museum_id => museum_id})
  @artwork.save()
  erb(:museum)
end
